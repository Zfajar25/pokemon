import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/models/pokemon_type_affinity.dart';
import 'package:pokemon_app_3/screens/pokemon_data.dart';
import 'package:provider/provider.dart';

class PokemonSingleDataWrapper extends StatelessWidget {
  const PokemonSingleDataWrapper(
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonIDDataProvider>.value(
            value: pokemonDataID),
        ChangeNotifierProvider<PokemonPageProvider>.value(value: pageData),
        ChangeNotifierProvider<IDCounterProvider>(
            create: (context) => IDCounterProvider()),
        ChangeNotifierProvider<PokemonTypeAffinityProvider>(
          create: (context) => PokemonTypeAffinityProvider(),
        )
      ],
      builder: (context, child) => PokemonSingleData(
          // pageData: pageData,
          index: index),
    );
  }
}
