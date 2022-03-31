import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';

class ChangeIDButton extends StatelessWidget {
  final PokemonIDDataProvider pokemonDataID;
  final IDCounterProvider idChangeCounter;
  final PokemonPageProvider pageData;
  final int index;
  const ChangeIDButton(
      {Key? key,
      required this.pageData,
      required this.pokemonDataID,
      required this.index,
      required this.idChangeCounter})
      : super(key: key);

  // I DONT KNOW HOW TO CHANGE DATA BECAUSE THE PROVIDER IS BEFORE THE NAVIGATIO.PUSH
  // SO THE DATA THAT CHANGE IS IN THE PREVIOUS SCREEN
  // BUT I DONT KNOW HOW TO REBUILD IT AGAIN INSIDE THIS SCREEN
  // HAAALLPPPPPP :((

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            idChangeCounter.idCounter == 0
                ? idChangeCounter
                    .decreaseID(pageData.pageData!.thePokemonList[index].id)
                : idChangeCounter.decreaseID(idChangeCounter.idCounter);
            //TODO
            //CHANGE THE DATA WITHIN SCREEN (DONE)
            //CHANGE PICTURE OF POKEMON
            await pokemonDataID.getIndividualIDData(idChangeCounter.idCounter);
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
          onPressed: () async {
            idChangeCounter.idCounter == 0
                ? idChangeCounter
                    .increaseID(pageData.pageData!.thePokemonList[index].id)
                : idChangeCounter.increaseID(idChangeCounter.idCounter);
            //TODO
            //CHANGE THE DATA WITHIN SCREEN (DOOOONEEEE)
            //CHANGE PICTURE OF POKEMON
            await pokemonDataID.getIndividualIDData(idChangeCounter.idCounter);
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
