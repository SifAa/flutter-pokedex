import 'dart:async';

import 'package:http/http.dart' as http;

class PokeAPI {
  static Future<http.Response> getPkmn() =>
      http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1025'));
}
