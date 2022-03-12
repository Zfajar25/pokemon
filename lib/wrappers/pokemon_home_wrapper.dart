import 'package:flutter/material.dart';

import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/screens/pokemon_home.dart';
import 'package:provider/provider.dart';

class PokemonHomeWrapper extends StatelessWidget {
  const PokemonHomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
            create: (context) => CounterProvider()),
        ChangeNotifierProvider<PokemonDataProvider>(
            create: (context) => PokemonDataProvider()),
        ChangeNotifierProvider<PokemonPageProvider>(
            create: (context) => PokemonPageProvider()),
      ],
      builder: (context, child) {
        return PokemonHomeApp();
      },
    );
  }
}
