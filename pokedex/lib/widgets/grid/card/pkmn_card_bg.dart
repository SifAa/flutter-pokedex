import 'package:flutter/material.dart';

class PkmnCardBg extends StatelessWidget {
  final int id;
  const PkmnCardBg({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "$id",
      child: Material(
        color: Colors.white,
        type: MaterialType.transparency,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(21),
          ),
        ),
        child: Text(
          "$id",
          style: TextStyle(
              fontSize: 101,
              fontWeight: FontWeight.bold,
              color: Colors.grey[200]),
        ),
      ),
    );
  }
}

// The background for the card with the id number and its styling, hero animation between the id on the card and the details page
