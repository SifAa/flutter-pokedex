import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/grid/pkmnn_grid_items.dart';

class PkmnGrid extends StatefulWidget {
  final List<Pokemon> pokemon;
  const PkmnGrid({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PkmnGrid> createState() => _PkmnGridState();
}

class _PkmnGridState extends State<PkmnGrid> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;
    return LiveSliverGrid(
      itemBuilder: (context, index, animation) {
        return pkmnGridItem(context, index, animation, widget.pokemon);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.pokemon.isEmpty ? 1 : crossAxisCount,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 200 / 244),
      itemCount: 250,
      controller: scrollController,
      showItemDuration: const Duration(milliseconds: 1000),
      showItemInterval: const Duration(milliseconds: 50),
      visibleFraction: 0.001,
    );
  }
}

// Sliver grid that takes in the width of the screen and determines how many grid items should be shown and how many items total