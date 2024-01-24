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
      // onStretchTrigger: (){},
      centerTitle: true,
      expandedHeight: 251,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'Pokedex',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
        collapseMode: CollapseMode.parallax,
        stretchModes: const [StretchMode.fadeTitle, StretchMode.zoomBackground],
      ),
    );
  }
}

// An appbar with an image that works with slivergrid, the image fades out as one scrolls down so the appbar becomes a solid color (theme primary) and when scrolling back up to the top the image fades in again

// TODO change it so standard it says pokedex, but if there is a prop change it to that