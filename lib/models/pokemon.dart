import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class PokemonPageProvider extends ChangeNotifier {
  PokemonPage? _pageData;
  PokemonPage? get pageData => _pageData;

  set pageData(PokemonPage? value) {
    _pageData = value;
    notifyListeners();
  }

  Future<PokemonPage?> getPokemonPage(int pageNumber) async {
    Response response = await get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=100&offset=${pageNumber * 100}'));
    var jsonResponse = jsonDecode(response.body);
    PokemonPage data = PokemonPage.fromJson(jsonResponse);

    pageData = data;
    return pageData;
  }
}

class PokemonPage {
  String loadNextPage;
  List<PokemonList> thePokemonList;

  PokemonPage({required this.loadNextPage, required this.thePokemonList});
  factory PokemonPage.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<PokemonList> pokemonList =
        list.map((data) => PokemonList.fromJson(data)).toList();

    return PokemonPage(loadNextPage: json['next'], thePokemonList: pokemonList);
  }
}

class PokemonList {
  String url;
  String name;
  int id;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonList({required this.url, required this.name, required this.id});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonList(name: json['name'], url: json['url'], id: id);
  }
}

// This is for the individual data of pokemon
class PokemonDataProvider extends ChangeNotifier {
  PokemonIndividual? _pokemonIndividual;
  PokemonIndividual? get pokemonIndividual => _pokemonIndividual;

  set pokemonIndividual(PokemonIndividual? value) {
    _pokemonIndividual = value;
    notifyListeners();
  }

  Future<PokemonIndividual?> getIndividualData(
      int index, PokemonPageProvider pageData) async {
    if (pageData.pageData != null) {
      Response response =
          await get(Uri.parse(pageData.pageData!.thePokemonList[index].url));
      var jsonResponse = jsonDecode(response.body);
      PokemonIndividual data = PokemonIndividual.fromJson(jsonResponse);

      pokemonIndividual = data;
    } else {
      print('Something is wrong');
    }
    return pokemonIndividual;
  }
}

class PokemonIndividual {
  int weight;
  int height;
  String name;
  int baseExperience;
  List<PokemonStats> thePokemonStats;

  PokemonIndividual(
      {required this.baseExperience,
      required this.height,
      required this.name,
      required this.thePokemonStats,
      required this.weight});

  factory PokemonIndividual.fromJson(Map<String, dynamic> json) {
    var list = json['stats'] as List;
    return PokemonIndividual(
        baseExperience: json['base_experience'],
        height: json['height'],
        name: json['name'],
        weight: json['weight'],
        thePokemonStats:
            list.map((data) => PokemonStats.fromJson(data)).toList());
  }
}

class PokemonStats {
  int baseStat;
  PokemonStatsName pokemonStatsName;

  PokemonStats({required this.pokemonStatsName, required this.baseStat});

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
        baseStat: json['base_stat'],
        pokemonStatsName: PokemonStatsName.fromJson(json['stat']));
  }
}

class PokemonStatsName {
  String statName;

  PokemonStatsName({required this.statName});

  factory PokemonStatsName.fromJson(Map<String, dynamic> json) {
    return PokemonStatsName(
      statName: json['name'],
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increasePage() {
    if (_counter != 11) {
      _counter++;
    } else {
      _counter = 11;
    }
    notifyListeners();
  }

  void decreasePage() {
    if (_counter != 0) {
      _counter--;
    } else {
      _counter = 0;
    }
    notifyListeners();
  }
}
