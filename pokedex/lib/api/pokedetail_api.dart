import 'dart:async';
import 'package:http/http.dart' as http;

class PokeDetailAPI {
  static Future<http.Response> getPkmn(int? id) =>
      http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
}
