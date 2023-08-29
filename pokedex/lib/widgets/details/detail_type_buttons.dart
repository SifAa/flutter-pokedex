import 'package:flutter/material.dart';
import 'package:pokedex/widgets/types/type_button.dart';

Widget typeButtons(List<String> types) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: types
        .map((type) => Row(
              children: [
                if (types.indexOf(type) != 0) const SizedBox(width: 8),
                TypeBtn(
                  type: type,
                  fontSize: 18.0,
                ),
              ],
            ))
        .toList(),
  );
}
