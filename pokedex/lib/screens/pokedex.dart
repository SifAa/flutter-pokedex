import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/extension/build_context.extension.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utility.dart';
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
  bool _isSearchMode = false;
  final TextEditingController _textEditingController = TextEditingController();

  final ScrollManager _scrollManager = ScrollManager();

  // scroll to pokemon with the name or id that matches the search, if no match then show a snackbar saying no match found
  void _searchButtonPressed(BuildContext context) {
    String searchTerm = _textEditingController.text.toLowerCase();
    int index = pokemon.indexWhere((p) =>
        p.name.toLowerCase() == searchTerm || p.id.toString() == searchTerm);

    if (index != -1) {
      _scrollManager.scrollToIndex(index, context.pkmnGridItemHeight);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No match found for "$searchTerm"'),
        ),
      );
    }
    print("Searched for ${_textEditingController.text}");
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
          String imgUrl;
          const String imgUrlBase = "https://www.serebii.net/pokemon/art/";

          // if id is less than 10 add a 00 in front of id
          if (id <= 9) {
            imgUrl = '${imgUrlBase}00$id.png';
          } else if (id <= 99) {
            imgUrl = '${imgUrlBase}0$id.png';
          } else {
            imgUrl = '$imgUrlBase$id.png';
          }

          e.value['img'] = imgUrl;
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
      floatingActionButton: currentPageIndex == 0
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isSearchMode ? _searchBar(context) : _searchButton())
          : null,
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

  // Search button widget that transforms to a search bar when pressed
  Widget _searchButton() => FloatingActionButton(
        heroTag: 'fab',
        onPressed: () {
          setState(() {
            _isSearchMode = true;
          });
        },
        tooltip: 'Search',
        child: const Icon(
          Icons.search_rounded,
        ),
      );

  //search bar which fills the screen width when pressed. in the search bar it should have an icon x that transforms it back to a floating action button, a textfield and a button search. When pressed search it should scroll to pokemon with the name or id that matches the search, if no match then show a snackbar saying no match found
  Widget _searchBar(BuildContext context) => Padding(
        // TODO: find better solution to this
        padding:
            const EdgeInsets.only(left: 30), // temporary fix to design issue
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearchMode = false;
                  });
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _searchButtonPressed(context),
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
