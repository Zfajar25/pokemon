import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/loading.dart';
import 'package:pokemon_app_3/widget/pokemon_data_single.dart';

class PokemonSingleData extends StatelessWidget {
  const PokemonSingleData(
      {Key? key,
      required this.pokemonDataID,
      required this.pageData,
      required this.index})
      : super(key: key);
  final PokemonIDDataProvider pokemonDataID;
  final PokemonPageProvider pageData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return pokemonDataID.pokemonIndividualID != null
        ? Scaffold(
            backgroundColor: Colors.yellowAccent,
            appBar: AppBar(
              title: Text(
                pokemonDataID.pokemonIndividualID!.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              foregroundColor: Colors.red,
              backgroundColor: Colors.yellow,
            ),
            body: PokemonSingleDataInside(
              pokemonDataID: pokemonDataID,
              pageData: pageData,
              index: index,
            ),
          )
        : const LoadingWidget();
  }
}
