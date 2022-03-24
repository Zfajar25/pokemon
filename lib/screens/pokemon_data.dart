import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/loading.dart';

class PokemonSingleData extends StatelessWidget {
  PokemonSingleData(
      {Key? key,
      required this.pokemonData,
      required this.pageData,
      required this.index})
      : super(key: key);
  PokemonDataProvider pokemonData;
  PokemonPageProvider pageData;
  int index;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return pokemonData.pokemonIndividual != null
        ? Scaffold(
            backgroundColor: Colors.yellowAccent,
            appBar: AppBar(
              title: Text(
                pokemonData.pokemonIndividual!.name.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              foregroundColor: Colors.red,
              backgroundColor: Colors.yellow,
            ),
            body: Stack(children: [
              Positioned(
                  top: screenHeight * 0.1,
                  right: 0,
                  child: Image.asset('assets/pokeball.png',
                      height: 200, fit: BoxFit.fitHeight)),
              Positioned(
                top: 0,
                left: screenWidth * 0.25,
                child: Image.network(
                  pageData.pageData!.thePokemonList[index].imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.59,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${pokemonData.pokemonIndividual!.name}'),
                        Text(
                            'Weight: ${pokemonData.pokemonIndividual!.weight}'),
                        Text(
                            'Height: ${pokemonData.pokemonIndividual!.height}'),
                        Text(
                            'Base Experience : ${pokemonData.pokemonIndividual!.baseExperience}'),
                        Text(
                            'Hp: ${pokemonData.pokemonIndividual!.thePokemonStats[0].baseStat}'),
                        Text(
                            'Attack: ${pokemonData.pokemonIndividual!.thePokemonStats[1].baseStat}'),
                        Text(
                            'Defense: ${pokemonData.pokemonIndividual!.thePokemonStats[2].baseStat}'),
                        Text(
                            'Special Attack: ${pokemonData.pokemonIndividual!.thePokemonStats[3].baseStat}'),
                        Text(
                            'Special Defense: ${pokemonData.pokemonIndividual!.thePokemonStats[4].baseStat}'),
                        Text(
                            'Speed: ${pokemonData.pokemonIndividual!.thePokemonStats[5].baseStat}')
                      ],
                    ),
                  ),
                ),
              ),
            ]))
        : const LoadingWidget();
  }
}
