import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/models/pokemon_type_affinity.dart';

class PokemonTypePanel extends StatelessWidget {
  final PokemonTypeAffinityProvider pokemonType;
  final PokemonIDDataProvider pokemonDataID;
  final int typeIndex;
  const PokemonTypePanel(
      {Key? key,
      required this.pokemonDataID,
      required this.pokemonType,
      required this.typeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(pokemonDataID
              .pokemonIndividualID!.pokemonTypes[typeIndex].pokemonType.name),
          Text(pokemonType
              .pokemonTypeAffinity!.damageRelation.doubleDamageFrom[0].name)
        ],
      ),
    );
  }
}
