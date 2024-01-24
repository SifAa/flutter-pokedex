import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_detail_model.dart';
import 'package:transparent_image/transparent_image.dart';

Widget spriteImages(Sprites sprites) {
  final spriteWidgets = <Widget>[];

  if (sprites.normal.url.isNotEmpty) {
    spriteWidgets.add(Column(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: sprites.normal.url,
          fadeInDuration: const Duration(milliseconds: 300),
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        const SizedBox(height: 3),
        Text(
          sprites.normal.name[0].toUpperCase() +
              sprites.normal.name.substring(1),
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    ));
  }

  if (sprites.shiny.url.isNotEmpty) {
    if (spriteWidgets.isNotEmpty) {
      spriteWidgets.add(const SizedBox(width: 15));
    }

    spriteWidgets.add(Column(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: sprites.shiny.url,
          fadeInDuration: const Duration(milliseconds: 300),
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        const SizedBox(height: 3),
        Text(
          sprites.shiny.name[0].toUpperCase() + sprites.shiny.name.substring(1),
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    ));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: spriteWidgets,
  );
}
