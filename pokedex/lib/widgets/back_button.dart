import 'package:flutter/material.dart';

class FabBackBtn extends StatelessWidget {
  const FabBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "fab",
      onPressed: () => Navigator.pop(context),
      label: const Text(
        "Back",
      ),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}

// A floating button to take the user back to the previous page, it has a transition effect with the search button