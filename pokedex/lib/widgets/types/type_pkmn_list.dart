import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/api/poketype_api.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/pokedex_app_bar.dart';
import 'package:pokedex/widgets/grid/pkmn_grid.dart';
import 'package:http/http.dart' as http;

class TypePkmnList extends StatefulWidget {
  final String type;

  const TypePkmnList({required this.type});

  @override
  State<TypePkmnList> createState() => _TypePkmnListState();
}

class _TypePkmnListState extends State<TypePkmnList> {
  List<Pokemon> pokemon = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch the Pokémon data based on the selected type
    getPkmnFromApi(widget.type);
    // isLoading = false;
  }

  void getPkmnFromApi(String type) async {
    PokeAPI.getPkmn(type).then((response) async {
      List<Map<String, dynamic>> data =
          List.from(jsonDecode(response.body)['pokemon']);
      List<Pokemon> updatedPokemonList = [];

      for (var entry in data) {
        final pokemonInfo = entry['pokemon'];
        final id = int.parse(pokemonInfo['url'].split('/').elementAt(6));
        String imgUrl;

        if (id <= 1010) {
          imgUrl =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

          // Check if the URL is valid by making a HEAD request
          http.Response headResponse = await http.head(Uri.parse(imgUrl));
          if (headResponse.statusCode == 404) {
            // URL is not valid, use the alternative URL
            imgUrl =
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
          }
        } else {
          imgUrl =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
        }

        updatedPokemonList.add(Pokemon.fromJson({
          ...pokemonInfo,
          'id': id,
          'name': pokemonInfo['name'],
          'img': imgUrl,
        }));
      }

      setState(() {
        pokemon = updatedPokemonList;
        isLoading = false; // Data has been fetched
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const PokedexAppBar(),
          const SliverPadding(padding: EdgeInsets.all(4)),
          isLoading
              ? const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : PkmnGrid(pokemon: pokemon),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'fab',
      //   onPressed: _searchButtonPressed,
      //   tooltip: 'Search',
      //   child: const Icon(
      //     Icons.search_rounded,
      //   ),
      // ),
    );
  }
}
