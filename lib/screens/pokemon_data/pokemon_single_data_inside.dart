import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/models/pokemon_type_affinity.dart';
import 'package:pokemon_app_3/screens/pokemon_data/change_id_button.dart';
import 'package:pokemon_app_3/screens/pokemon_data/pokemon_stats_data.dart';
import 'package:pokemon_app_3/screens/pokemon_data/pokemon_type_panel.dart';

class PokemonSingleDataInside extends StatelessWidget {
  final PokemonIDDataProvider pokemonDataID;
  final PokemonPageProvider pageData;
  final IDCounterProvider idChangeCounter;
  final PokemonTypeAffinityProvider pokemonType;
  final int index;
  const PokemonSingleDataInside(
      {Key? key,
      required this.pokemonDataID,
      required this.pageData,
      required this.index,
      required this.idChangeCounter,
      required this.pokemonType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var getTypeColor = GetTypeColor();

    return Stack(children: [
      Positioned(
        top: 10,
        left: 10,
        child: SizedBox(
          height: 300,
          width: 90,
          child: ListView.builder(
              itemCount: pokemonDataID.pokemonIndividualID!.pokemonTypes.length,
              itemBuilder: (context, typeIndex) {
                void _showPanel() {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          width: screenWidth,
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 10),
                          child: PokemonTypePanel(
                            pokemonDataID: pokemonDataID,
                            pokemonType: pokemonType,
                            typeIndex: typeIndex,
                          ),
                        );
                      });
                }

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    await pokemonType.getPokemonType(pokemonDataID
                        .pokemonIndividualID!
                        .pokemonTypes[typeIndex]
                        .pokemonType
                        .name);
                    _showPanel();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: getTypeColor.getTypeColor(pokemonDataID
                            .pokemonIndividualID!
                            .pokemonTypes[typeIndex]
                            .pokemonType
                            .name),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                        pokemonDataID.pokemonIndividualID!
                            .pokemonTypes[typeIndex].pokemonType.name
                            .capitalize(),
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Rubix'),
                      ),
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
      Positioned.fill(
        top: screenHeight * 0.25,
        bottom: screenHeight * 0.4,
        child: Container(
          width: screenWidth,
          height: 150,
          padding: const EdgeInsets.only(left: 10, top: 10),
          decoration: const BoxDecoration(
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
                    itemCount:
                        pokemonDataID.pokemonIndividualID!.abilities.length,
                    itemBuilder: (context, index) {
                      return Text(
                        pokemonDataID
                            .pokemonIndividualID!.abilities[index].ability.name
                            .capitalize(),
                        style: const TextStyle(
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
          pokemonDataID.getImageUrl(idChangeCounter.idCounter == 0
              ? pageData.pageData!.thePokemonList[index].id
              : idChangeCounter.idCounter),
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
      Positioned.fill(
        bottom: 0,
        top: screenHeight * 0.35,
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: PokemonStatsData(
            pokemonDataID: pokemonDataID,
          ),
        ),
      ),
      Positioned(
        bottom: screenHeight * 0.05,
        left: screenWidth * 0.25,
        right: screenWidth * 0.25,
        child: SizedBox(
          height: 50,
          child: ChangeIDButton(
            pokemonDataID: pokemonDataID,
            pageData: pageData,
            idChangeCounter: idChangeCounter,
            index: index,
          ),
        ),
      )
    ]);
  }

  // getPokemonTypeResult(int number) {
  //   switch (pokemonDataID
  //       .pokemonIndividualID!.pokemonTypes[number].pokemonType.name) {
  //     case 'grass':
  //       return Container();
  //     case 'fire':
  //       return Container();
  //     case 'water':
  //       return Container();
  //     case 'poison':
  //       return Container();
  //     case 'electric':
  //       return Container();
  //     case 'flying':
  //       return Container();
  //     case 'fighting':
  //       return Container();
  //     case 'bug':
  //       return Container();
  //     case 'psychic':
  //       return Container();
  //     case 'ground':
  //       return Container();
  //     case 'steel':
  //       return Container();
  //     case 'dark':
  //       return Container();
  //     case 'ghost':
  //       return Container();
  //     default:
  //       return Container();
  //   }
  // }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
