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
    return pokemonData.pokemonIndividual != null
        ? Scaffold(
            backgroundColor: Colors.yellow[300],
            appBar: AppBar(
              title: Text(pokemonData.pokemonIndividual!.name),
              centerTitle: true,
              elevation: 0,
              foregroundColor: Colors.red,
              backgroundColor: Colors.yellow,
            ),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Image.network(
                    pageData.pageData!.thePokemonList[index].imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${pokemonData.pokemonIndividual!.name}'),
                      Text('Weight: ${pokemonData.pokemonIndividual!.weight}'),
                      Text('Height: ${pokemonData.pokemonIndividual!.height}'),
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
                  )
                ],
              ),
            ))
        : const LoadingWidget();
  }
}
