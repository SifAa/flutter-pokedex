import 'package:flutter/material.dart';
import 'package:pokedex/widgets/grid/card/pkmn_card_bg.dart';
import 'package:pokedex/widgets/grid/card/pkmn_card_data.dart';

class PkmnCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const PkmnCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(7), enableFeedback: true,
        splashColor: Colors.red[50],
        // onTap:() => ,
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              PkmnCardBg(id: id),
              PkmnCardData(id: id, name: name, image: image)
            ],
          ),
        ),
      ),
    );
  }
}
