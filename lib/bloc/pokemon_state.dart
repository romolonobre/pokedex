part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingInProgress extends PokemonState {}

class PokemonPageLoadSucess extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageLoadSucess(
      {required this.pokemonListing, required this.canLoadNextPage});
}

class PokemonLoadErro extends PokemonState {
  final String error;

  PokemonLoadErro({required this.error});
}
