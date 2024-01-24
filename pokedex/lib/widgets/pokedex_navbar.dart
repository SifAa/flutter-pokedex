import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final Function(int) onPageTapped; // Callback function
  final int currentPageIndex;

  const NavBar({
    required this.onPageTapped,
    required this.currentPageIndex, // Initialize this parameter
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //TODO make navigation bar look like the blue buttons on the pokedex if possible
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedItemColor: const Color.fromARGB(255, 42, 170, 253),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 16),
      selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color.fromARGB(255, 42, 170, 253)),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: widget.currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: widget.onPageTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 42, 170, 253),
          icon: Icon(Icons.home),
          label: 'Pokemon',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          label: "Types",
        ),
      ],
    );
  }
}
