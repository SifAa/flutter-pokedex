import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/grid/pkmn_grid.dart';
import 'package:pokedex/widgets/pokedex_app_bar.dart';
import 'package:pokedex/widgets/pokedex_navbar.dart';
import 'package:pokedex/widgets/types/type_grid.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  void _searchButtonPressed() {
    // Put your search logic here
    print("Search button pressed");
  }

  List<Pokemon> pokemon = List.empty();

  void getPkmnFromApi() async {
    PokeAPI.getPkmn().then((response) {
      List<Map<String, dynamic>> data =
          List.from(jsonDecode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((e) {
          final id = e.key + 1;
          e.value['id'] = id;
          e.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
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

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Widget currentWidget =
        currentPageIndex == 0 ? PkmnGrid(pokemon: pokemon) : const TypeGrid();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const PokedexAppBar(),
          const SliverPadding(padding: EdgeInsets.all(4)),
          currentWidget,
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
          ),
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
      bottomNavigationBar: NavBar(
        onPageTapped: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentPageIndex: currentPageIndex, // Pass the currentPageIndex here
      ),
    );
  }
}
