import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:pokemon_app_3/screens/pokemon_data.dart';
import 'package:pokemon_app_3/widget/loading.dart';
import 'package:provider/provider.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key, required this.pageData, required this.pokemonData})
      : super(key: key);
  PokemonPageProvider pageData;
  PokemonDataProvider pokemonData;
  var result;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
          itemCount: pageData.pageData!.thePokemonList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  result = await pokemonData.getIndividualData(index, pageData);
                  if (result == null) {
                    LoadingWidget();
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokemonSingleData(
                                pokemonData: pokemonData,
                                pageData: pageData,
                                index: index)));
                  }
                },
                child: Container(
                    color: Colors.amber,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pageData.pageData!.thePokemonList[index].name,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'ID: ${pageData.pageData!.thePokemonList[index].id}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Image.network(
                            pageData.pageData!.thePokemonList[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ])));
          }),
    ));
  }
}
