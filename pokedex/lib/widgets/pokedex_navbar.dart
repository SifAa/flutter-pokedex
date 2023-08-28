import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  void _onDestinationTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //TODO make navigation bar look like the blue buttons on the pokedex
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedItemColor: Color.fromARGB(255, 42, 170, 253),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 16),
      selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color.fromARGB(255, 42, 170, 253)),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onDestinationTapped,
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
