import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokedex_navbar.dart';
import 'package:pokedex/widgets/pokedex_app_bar.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/widgets/grid/pkmn_grid.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  // Add your logic here
  void _searchButtonPressed() {
    // Put your search logic here
    print("Search button pressed");
  }

  List<Pokemon> pokemon = List.empty();

  void getPkmnFromApi() async {
    PokeAPI.getPkmn().then((response) {
      // print(jsonDecode(response.body)['results']);
      List<Map<String, dynamic>> data =
          List.from(jsonDecode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((e) {
          e.value['id'] = e.key + 1;
          e.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${e.key + 1}.png";
          return Pokemon.fromJson(e.value);
        }).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPkmnFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const PokedexAppBar(),
          const SliverPadding(padding: EdgeInsets.all(4)),
          PkmnGrid(pokemon: pokemon)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        onPressed: _searchButtonPressed,
        tooltip: 'Search',
        child: const Icon(
          Icons.search_rounded,
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
