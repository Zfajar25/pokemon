import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/widget/pokemon_stats_data.dart';

class PokemonSingleDataInside extends StatelessWidget {
  final PokemonDataProvider pokemonData;
  final PokemonPageProvider pageData;
  final int index;
  const PokemonSingleDataInside(
      {Key? key,
      required this.pokemonData,
      required this.pageData,
      required this.index})
      : super(key: key);

  getColor(int number) {
    Color? color = Colors.white;
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'grass') {
      return color = Colors.green;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'poison') {
      return color = Colors.grey;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'fire') {
      return color = Colors.red;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'water') {
      return color = Colors.blue;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'flying') {
      return color = Colors.orange;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'ground') {
      return color = Colors.brown;
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'electric') {
      return color = Colors.cyan[400];
    }
    if (pokemonData.pokemonIndividual!.pokemonTypes[number].pokemonType.name ==
        'psychic') {
      return color = Colors.purple;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Positioned(
        top: 10,
        left: 10,
        child: SizedBox(
          height: 300,
          width: 90,
          child: ListView.builder(
              itemCount: pokemonData.pokemonIndividual!.pokemonTypes.length,
              itemBuilder: (context, number) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: getColor(number),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      pokemonData.pokemonIndividual!.pokemonTypes[number]
                          .pokemonType.name
                          .capitalize(),
                      style: TextStyle(fontSize: 20, fontFamily: 'Rubix'),
                    ),
                  ),
                );
              }),
        ),
      ),
      Positioned(
          top: screenHeight * 0.1,
          right: 0,
          child: Image.asset('assets/pokeball.png',
              height: 200, fit: BoxFit.fitHeight)),
      Positioned(
        top: screenHeight * 0.25,
        child: Container(
          width: screenWidth,
          height: 150,
          padding: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Abilities :',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Rubix',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              SizedBox(
                width: screenWidth,
                height: 45,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 1),
                    itemCount: pokemonData.pokemonIndividual!.abilities.length,
                    itemBuilder: (context, index) {
                      return Text(
                        pokemonData
                            .pokemonIndividual!.abilities[index].ability.name
                            .capitalize(),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rubix',
                            fontWeight: FontWeight.w300),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
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
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: PokemonStatsData(
            pokemonData: pokemonData,
          ),
        ),
      ),
    ]);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
