import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/change_id_button.dart';
import 'package:provider/provider.dart';

class ChangeID extends StatelessWidget {
  final PokemonIDDataProvider pokemonDataID;
  final PokemonPageProvider pageData;
  final int index;
  const ChangeID(
      {Key? key,
      required this.pageData,
      required this.pokemonDataID,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonIDDataProvider>(
          create: (context) => PokemonIDDataProvider(),
        ),
        ChangeNotifierProvider<IDCounterProvider>(
          create: (context) => IDCounterProvider(),
        )
      ],
      builder: (context, child) {
        return ChangeIDButton(
          pokemonDataID: pokemonDataID,
          pageData: pageData,
          index: index,
        );
      },
    );
  }
}
