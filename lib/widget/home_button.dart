import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';

class HomeButton extends StatelessWidget {
  HomeButton({Key? key, required this.pageData, required this.pageCounter})
      : super(key: key);
  PokemonPageProvider pageData;
  CounterProvider pageCounter;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Pokemon Database App',
            style: TextStyle(
                fontSize: 20,
                color: Colors.red[900],
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              pageData.getPokemonPage(pageCounter.counter);
            },
            child: Text('Get Pokemon'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.yellow,
                shape: RoundedRectangleBorder()),
          )
        ],
      ),
    );
  }
}
