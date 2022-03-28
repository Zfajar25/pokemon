import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/grid_data.dart';
import 'package:pokemon_app_3/widget/home_appbar_action.dart';
import 'package:pokemon_app_3/widget/home_button.dart';
import 'package:provider/provider.dart';

class PokemonHomeApp extends StatelessWidget {
  const PokemonHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageData = Provider.of<PokemonPageProvider>(context);
    final pokemonData = Provider.of<PokemonDataProvider>(context);
    final pageCounter = Provider.of<CounterProvider>(context);
    final pokemonDataID = Provider.of<PokemonIDDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pageData.pageData == null ? 'Pokemon App' : 'Pokemon Database',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.red,
          backgroundColor: Colors.yellow[700],
          actions: [
            pageData.pageData == null
                ? Container()
                : AppBarAction(pageCounter: pageCounter, pageData: pageData)
          ],
        ),
        body: Stack(children: [
          Image.asset(
            'assets/pokemon.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          pageData.pageData == null
              ? HomeButton(
                  pageData: pageData,
                  pageCounter: pageCounter,
                )
              : GridWidget(pageData: pageData, pokemonDataID: pokemonDataID),
        ]));
  }
}
