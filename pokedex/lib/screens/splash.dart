import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // with TickerProviderStateMixin: Provides Ticker objects that are configured to only tick while the current tree is enabled, as defined by TickerMode. Needed for more advanced Animation controllers

  // these are the ones that control duration of animation and when they are called
  late final AnimationController _slideController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late final AnimationController _fadeController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late final AnimationController _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1500), vsync: this);

  // Animation that makes the widget slide from outside the top of the screen to its chosen position on the screen
  late final Animation<Offset> _slideAnimation =
      Tween<Offset>(begin: const Offset(0, -4), end: const Offset(0, 0))
          .animate(
    CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticInOut,
    ),
  );

  // Animation that fades the widget
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeInOut,
  );

  // Animation that scales the widget to 4 times its size
  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.4, end: 4).animate(
    CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticInOut,
    ),
  );

  @override
  void initState() {
    super.initState();
    // Slides and fades the widget upon page load
    _slideController.forward();
    _fadeController.forward();

    Future.delayed(const Duration(milliseconds: 1721)).then((value) {
      // Waits a set amount of time before fading the widget out whilst enlarging it
      _fadeController.reverse();
      _scaleController.forward();
    });
    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Pokedex(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation.drive(Tween(begin: 0, end: 1)),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 671),
                reverseTransitionDuration: const Duration(milliseconds: 671)))
        // This navigates to the pokedex page, removing the option to go back to the splash page and changing the transition from the standard animation to a fade animation
        );
  }

  @override
  void dispose() {
    // Removes the animation because AnimationControllers need to be disposed to detach the animation callbacks when the StatefulWidget goes out of scope
    _slideController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
                position: _slideAnimation,
                child: Center(
                    // positions the widget being animated in the center of the screen
                    child: Image.asset('assets/images/splash_icon.png'))),
          )),
    );
  }
}
