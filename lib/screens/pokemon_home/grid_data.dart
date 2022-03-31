import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/wrappers/pokemon_data_wrapper.dart';

class GridWidget extends StatelessWidget {
  const GridWidget(
      {Key? key, required this.pageData, required this.pokemonDataID})
      : super(key: key);
  final PokemonPageProvider pageData;
  final PokemonIDDataProvider pokemonDataID;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.4),
          itemCount: pageData.pageData!.thePokemonList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  await pokemonDataID.getIndividualIDData(
                      pageData.pageData!.thePokemonList[index].id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonSingleDataWrapper(
                            pokemonDataID: pokemonDataID,
                            pageData: pageData,
                            index: index),
                      ));
                },
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Stack(children: [
                      Positioned(
                        top: -10,
                        right: -10,
                        child: Image.asset(
                          'assets/pokeball.png',
                          fit: BoxFit.fitHeight,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 5,
                        child: Text(
                          pageData.pageData!.thePokemonList[index].name
                              .capitalize(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Text(
                          'ID: ${pageData.pageData!.thePokemonList[index].id}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 40,
                        child: Image.network(
                          pageData.pageData!.thePokemonList[index].imageUrl,
                          height: 120,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ])));
          }),
    ));
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
