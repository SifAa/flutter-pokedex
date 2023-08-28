import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/grid/card/pkmn_card.dart';

Widget pkmnGridItem(
  BuildContext context,
  int index,
  Animation<double> animation,
  List<Pokemon> pokemon,
) =>
    FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: pokemon.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PkmnCard(
              id: pokemon.elementAt(index).id,
              name: pokemon.elementAt(index).name,
              image: pokemon.elementAt(index).img),
    );
