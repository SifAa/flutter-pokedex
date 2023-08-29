import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_detail_model.dart';
import 'package:transparent_image/transparent_image.dart';

Widget spriteImages(List<Sprites> sprites) {
  if (sprites.isNotEmpty) {
    final spriteWidgets = <Widget>[];

    for (var sprite in sprites) {
      if (spriteWidgets.isNotEmpty) {
        spriteWidgets.add(const SizedBox(width: 15));
      }

      spriteWidgets.add(
        Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: sprite.normal,
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 3),
            Text(
              sprite.name[0].toUpperCase() + sprite.name.substring(1),
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: spriteWidgets,
    );
  }

  return const SizedBox();
}
