import 'package:flutter/material.dart';
import 'package:pokemon_app_3/models/pokemon.dart';

class AppBarAction extends StatelessWidget {
  AppBarAction({Key? key, required this.pageCounter, required this.pageData})
      : super(key: key);
  PokemonPageProvider pageData;
  CounterProvider pageCounter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            pageCounter.decreasePage();
            pageData.getPokemonPage(pageCounter.counter);
          },
          icon: Icon(Icons.arrow_left_outlined),
        ),
        Text(
          '${pageCounter.counter}',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        IconButton(
            onPressed: () {
              pageCounter.increasePage();
              pageData.getPokemonPage(pageCounter.counter);
            },
            icon: Icon(Icons.arrow_right_outlined))
      ],
    );
  }
}
