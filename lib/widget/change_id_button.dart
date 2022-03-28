import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';
import 'package:provider/provider.dart';

class ChangeIDButton extends StatelessWidget {
  final PokemonIDDataProvider pokemonDataID;
  final PokemonPageProvider pageData;
  final int index;
  const ChangeIDButton(
      {Key? key,
      required this.pageData,
      required this.pokemonDataID,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var idChangeCounter = Provider.of<IDCounterProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            idChangeCounter
                .decreaseID(pageData.pageData!.thePokemonList[index].id);
            //TODO
            //CHANGE THE DATA WITHIN SCREEN
          },
          child: Icon(
            Icons.arrow_left,
            size: 30,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.yellow,
              animationDuration: Duration(milliseconds: 500)),
        ),
        Spacer(),
        Text(
          idChangeCounter.idCounter == 0
              ? '${pageData.pageData!.thePokemonList[index].id}'
              : '${idChangeCounter.idCounter}',
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            idChangeCounter
                .increaseID(pageData.pageData!.thePokemonList[index].id);
            //TODO
            //CHANGE THE DATA WITHIN SCREEN
          },
          child: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.yellow,
              animationDuration: Duration(milliseconds: 500)),
        )
      ],
    );
  }
}
