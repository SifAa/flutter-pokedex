import 'dart:async';

import 'package:http/http.dart' as http;

class PokeTypeAPI {
  static Future<http.Response> getPkmn(String? type) =>
      http.get(Uri.parse('https://pokeapi.co/api/v2/type/$type'));
}
