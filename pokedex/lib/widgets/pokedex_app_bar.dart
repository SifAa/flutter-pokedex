import 'package:flutter/material.dart';

class PokedexAppBar extends StatefulWidget {
  const PokedexAppBar({super.key});

  @override
  State<PokedexAppBar> createState() => _PokedexAppBarState();
}

class _PokedexAppBarState extends State<PokedexAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      centerTitle: true,
      expandedHeight: 251,
      title: const Text(
        'Pokedex',
        style: TextStyle(fontSize: 24),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
        collapseMode: CollapseMode.parallax,
        stretchModes: const [StretchMode.fadeTitle, StretchMode.zoomBackground],
      ),
    );
  }
}
