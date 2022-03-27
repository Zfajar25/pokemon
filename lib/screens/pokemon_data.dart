import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/loading.dart';
import 'package:pokemon_app_3/widget/pokemon_data_single.dart';

class PokemonSingleData extends StatelessWidget {
  const PokemonSingleData(
      {Key? key,
      required this.pokemonData,
      required this.pageData,
      required this.index})
      : super(key: key);
  final PokemonDataProvider pokemonData;
  final PokemonPageProvider pageData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return pokemonData.pokemonIndividual != null
        ? Scaffold(
            backgroundColor: Colors.yellowAccent,
            appBar: AppBar(
              title: Text(
                pokemonData.pokemonIndividual!.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              foregroundColor: Colors.red,
              backgroundColor: Colors.yellow,
            ),
            body: PokemonSingleDataInside(
              pokemonData: pokemonData,
              pageData: pageData,
              index: index,
            ),
          )
        : const LoadingWidget();
  }
}
