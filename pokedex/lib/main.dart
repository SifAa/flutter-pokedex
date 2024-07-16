import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex.dart';
import 'package:pokedex/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            //seedColor: const Color.fromARGB(255, 254, 0, 2)),
            seedColor: const Color.fromARGB(255, 254, 0, 0)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/pokedex': (context) => const Pokedex(),
      },
    );
  }
}
