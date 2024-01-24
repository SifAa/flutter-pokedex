import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:pokedex/widgets/types/type_button.dart';

class TypeGrid extends StatefulWidget {
  const TypeGrid({super.key});

  @override
  State<TypeGrid> createState() => _TypeGridState();
}

class _TypeGridState extends State<TypeGrid> {
  final List<String> typeNames = [
    "normal",
    "fighting",
    "flying",
    "poison",
    "ground",
    "rock",
    "bug",
    "ghost",
    "steel",
    "fire",
    "water",
    "grass",
    "electric",
    "psychic",
    "ice",
    "dragon",
    "dark",
    "fairy",
  ];

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
        final typeName = typeNames[index % typeNames.length];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: TypeBtn(
            type: typeName,
            fontSize: 18.0,
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 20,
          childAspectRatio: 200 / 55),
      itemCount: typeNames.length,
      controller: scrollController,
      showItemDuration: const Duration(milliseconds: 1000),
      showItemInterval: const Duration(milliseconds: 50),
      visibleFraction: 0.001,
    );
  }
}
