import 'package:flutter/material.dart';
import 'package:pokemon_app_3/constant/stat_text_style.dart';
import 'package:pokemon_app_3/models/pokemon.dart';

class PokemonStatsData extends StatelessWidget {
  final PokemonIDDataProvider pokemonDataID;
  const PokemonStatsData({Key? key, required this.pokemonDataID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: statsStyle,
                ),
                Text(
                  'HP',
                  style: statsStyle,
                ),
                Text('Attack', style: statsStyle),
                Text('Defense', style: statsStyle),
                Text('Weight', style: statsStyle),
                Text('Height', style: statsStyle),
                Text('Base Experience', style: statsStyle),
                Text('Special Attack', style: statsStyle),
                Text('Special Defense', style: statsStyle),
                Text('Speed', style: statsStyle)
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
                Text(':', style: statsStyle),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(pokemonDataID.pokemonIndividualID!.name.toCapitalize(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[0].baseStat
                          .toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[1].baseStat
                          .toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[2].baseStat
                          .toString(),
                      style: statsStyle),
                  Text(pokemonDataID.pokemonIndividualID!.weight.toString(),
                      style: statsStyle),
                  Text(pokemonDataID.pokemonIndividualID!.height.toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID.pokemonIndividualID!.baseExperience
                          .toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[3].baseStat
                          .toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[4].baseStat
                          .toString(),
                      style: statsStyle),
                  Text(
                      pokemonDataID
                          .pokemonIndividualID!.thePokemonStats[5].baseStat
                          .toString(),
                      style: statsStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
