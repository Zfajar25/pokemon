import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PokemonTypeAffinityProvider extends ChangeNotifier {
  PokemonTypeAffinity? _pokemonTypeAffinity;
  PokemonTypeAffinity? get pokemonTypeAffinity => _pokemonTypeAffinity;

  set pokemonTypeAffinity(PokemonTypeAffinity? value) {
    _pokemonTypeAffinity = value;
    notifyListeners();
  }

  Future<PokemonTypeAffinity?> getPokemonType(String name) async {
    String _typeUrl = '';
    switch (name) {
      case 'fighting':
        _typeUrl = 'https://pokeapi.co/api/v2/type/2/';
        break;
      case 'flying':
        _typeUrl = 'https://pokeapi.co/api/v2/type/3/';
        break;
      case 'poison':
        _typeUrl = 'https://pokeapi.co/api/v2/type/4/';
        break;
      case 'ground':
        _typeUrl = 'https://pokeapi.co/api/v2/type/5/';
        break;
      case 'rock':
        _typeUrl = 'https://pokeapi.co/api/v2/type/6/';
        break;
      case 'bug':
        _typeUrl = 'https://pokeapi.co/api/v2/type/7/';
        break;
      case 'ghost':
        _typeUrl = 'https://pokeapi.co/api/v2/type/8/';
        break;
      case 'steel':
        _typeUrl = 'https://pokeapi.co/api/v2/type/9/';
        break;
      case 'fire':
        _typeUrl = 'https://pokeapi.co/api/v2/type/10/';
        break;
      case 'water':
        _typeUrl = 'https://pokeapi.co/api/v2/type/11/';
        break;
      case 'grass':
        _typeUrl = 'https://pokeapi.co/api/v2/type/12/';
        break;
      case 'electric':
        _typeUrl = 'https://pokeapi.co/api/v2/type/13/';
        break;
      case 'psychic':
        _typeUrl = 'https://pokeapi.co/api/v2/type/14/';
        break;
      case 'ice':
        _typeUrl = 'https://pokeapi.co/api/v2/type/15/';
        break;
      case 'dragon':
        _typeUrl = 'https://pokeapi.co/api/v2/type/16/';
        break;
      case 'dark':
        _typeUrl = 'https://pokeapi.co/api/v2/type/17/';
        break;
      case 'fairy':
        _typeUrl = 'https://pokeapi.co/api/v2/type/18/';
        break;
      default:
        _typeUrl = 'https://pokeapi.co/api/v2/type/1/';
        break;
    }

    Response response = await get(Uri.parse(_typeUrl));
    var jsonRespone = jsonDecode(response.body);
    PokemonTypeAffinity data = PokemonTypeAffinity.fromJson(jsonRespone);
    pokemonTypeAffinity = data;
    return pokemonTypeAffinity;
  }
}

class PokemonTypeAffinity {
  DamageRelation damageRelation;

  PokemonTypeAffinity({required this.damageRelation});

  factory PokemonTypeAffinity.fromJson(Map<String, dynamic> json) {
    return PokemonTypeAffinity(
        damageRelation: DamageRelation.fromJson(json['damage_relations']));
  }
}

class DamageRelation {
  List<DoubleDamageFrom> doubleDamageFrom;
  List<DoubleDamageTo> doubleDamageTo;
  List<HalfDamageFrom> halfDamageFrom;
  List<HalfDamageTo> halfDamageTo;
  List<NoDamageFrom> noDamageFrom;
  List<NoDamageTo> noDamageTo;

  DamageRelation(
      {required this.doubleDamageFrom,
      required this.doubleDamageTo,
      required this.halfDamageFrom,
      required this.halfDamageTo,
      required this.noDamageTo,
      required this.noDamageFrom});

  factory DamageRelation.fromJson(Map<String, dynamic> json) {
    var list1 = json['double_damage_from'] as List;
    var list2 = json['double_damage_to'] as List;
    var list3 = json['half_damage_from'] as List;
    var list4 = json['half_damage_to'] as List;
    var list5 = json['no_damage_to'] as List;
    var list6 = json['no_damage_from'] as List;
    return DamageRelation(
        doubleDamageFrom:
            list1.map((e) => DoubleDamageFrom.fromJson(e)).toList(),
        doubleDamageTo: list2.map((e) => DoubleDamageTo.fromJson(e)).toList(),
        halfDamageFrom: list3.map((e) => HalfDamageFrom.fromJson(e)).toList(),
        halfDamageTo: list4.map((e) => HalfDamageTo.fromJson(e)).toList(),
        noDamageTo: list5.map((e) => NoDamageTo.fromJson(e)).toList(),
        noDamageFrom: list6.map((e) => NoDamageFrom.fromJson(e)).toList());
  }
}

class DoubleDamageFrom {
  String name;

  DoubleDamageFrom({required this.name});
  factory DoubleDamageFrom.fromJson(Map<String, dynamic> json) {
    return DoubleDamageFrom(name: json['name']);
  }
}

class DoubleDamageTo {
  String name;

  DoubleDamageTo({required this.name});

  factory DoubleDamageTo.fromJson(Map<String, dynamic> json) {
    return DoubleDamageTo(name: json['name']);
  }
}

class HalfDamageTo {
  String name;

  HalfDamageTo({required this.name});

  factory HalfDamageTo.fromJson(Map<String, dynamic> json) {
    return HalfDamageTo(name: json['name']);
  }
}

class HalfDamageFrom {
  String name;

  HalfDamageFrom({required this.name});

  factory HalfDamageFrom.fromJson(Map<String, dynamic> json) {
    return HalfDamageFrom(name: json['name']);
  }
}

class NoDamageTo {
  String name;

  NoDamageTo({required this.name});

  factory NoDamageTo.fromJson(Map<String, dynamic> json) {
    return NoDamageTo(name: json['name']);
  }
}

class NoDamageFrom {
  String name;

  NoDamageFrom({required this.name});

  factory NoDamageFrom.fromJson(Map<String, dynamic> json) {
    return NoDamageFrom(name: json['name']);
  }
}

class GetTypeColor {
  getTypeColor(String name) {
    switch (name) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'poison':
        return Colors.grey;
      case 'electric':
        return Colors.cyan[400];
      case 'flying':
        return Colors.orange;
      case 'fighting':
        return Colors.red[400];
      case 'bug':
        return Colors.limeAccent[700];
      case 'psychic':
        return Colors.purple[400];
      case 'ground':
        return Colors.brown[300];
      case 'steel':
        return Colors.grey[300];
      case 'dark':
        return Colors.purple;
      case 'ghost':
        return Colors.black45;
      default:
        return Colors.white;
    }
  }
}
