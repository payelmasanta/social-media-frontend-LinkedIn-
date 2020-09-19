import 'dart:convert';

import 'package:flutter/services.dart';

class Cities {
  String keyword;
  int id;
  String autocompleteterm;
  String state;

  Cities({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.state,
  });

  factory Cities.fromJson(Map<String, dynamic> parsedJson) {
    return Cities(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autocompleteterm: parsedJson['autocompleteTerm'] as String,
        state: parsedJson['state'] as String);
  }
}

class CitiesViewModel {
  static List<Cities> cities;

  static Future loadCities() async {
    try {
      cities = new List<Cities>();
      String jsonString = await rootBundle.loadString('assets/cities.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['cities'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        cities.add(new Cities.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
