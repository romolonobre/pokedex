import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_projeto/pokemo_repository.dart';
import 'package:pokedex_projeto/pokemon_listing.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemoRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(
      (event, emit) async {
        emit(PokemonLoadingInProgress());

        try {
          final pokemoPageResponse = await _pokemoRepository.getPokemonPage(0);

          emit(
            PokemonPageLoadSucess(
              canLoadNextPage: pokemoPageResponse.canLoadNextPage,
              pokemonListing: pokemoPageResponse.pokemonListings,
            ),
          );
        } catch (e) {
          {
            emit(PokemonLoadErro(error: 'error'));
          }
        }
      },
    );
  }
}
