import 'package:flutter/material.dart';
import 'package:pokedex/models/type_list_model.dart';
import 'package:pokedex/widgets/types/type_pkmn_list.dart';

class TypeBtn extends StatefulWidget {
  final String? type;
  final double fontSize;

  const TypeBtn({Key? key, this.type, this.fontSize = 16.0}) : super(key: key);

  @override
  State<TypeBtn> createState() => _TypeBtnState();
}

class _TypeBtnState extends State<TypeBtn> {
  List<TypeObject> types = [
    TypeObject(name: "normal", color: const Color.fromARGB(255, 168, 168, 120)),
    TypeObject(name: "fighting", color: const Color.fromARGB(255, 192, 48, 40)),
    TypeObject(name: "flying", color: const Color.fromARGB(255, 68, 144, 240)),
    TypeObject(name: "poison", color: const Color.fromARGB(255, 160, 64, 160)),
    TypeObject(name: "ground", color: const Color.fromARGB(255, 224, 192, 104)),
    TypeObject(name: "rock", color: const Color.fromARGB(255, 184, 160, 56)),
    TypeObject(name: "bug", color: const Color.fromARGB(255, 168, 184, 32)),
    TypeObject(name: "ghost", color: const Color.fromARGB(255, 112, 88, 152)),
    TypeObject(name: "steel", color: const Color.fromARGB(255, 184, 184, 208)),
    TypeObject(name: "fire", color: const Color.fromARGB(255, 240, 128, 48)),
    TypeObject(name: "water", color: const Color.fromARGB(255, 104, 144, 240)),
    TypeObject(name: "grass", color: const Color.fromARGB(255, 120, 200, 80)),
    TypeObject(
        name: "electric", color: const Color.fromARGB(255, 248, 208, 48)),
    TypeObject(name: "psychic", color: const Color.fromARGB(255, 248, 88, 136)),
    TypeObject(name: "ice", color: const Color.fromARGB(255, 152, 216, 216)),
    TypeObject(name: "dragon", color: const Color.fromARGB(255, 112, 56, 248)),
    TypeObject(name: "dark", color: const Color.fromARGB(255, 112, 88, 72)),
    TypeObject(name: "fairy", color: const Color.fromARGB(255, 238, 153, 172)),
    TypeObject(
        name: "unknown", color: const Color.fromARGB(255, 104, 160, 144)),
    TypeObject(name: "shadow", color: const Color.fromARGB(255, 49, 48, 87))
  ];

  @override
  Widget build(BuildContext context) {
    // Find the TypeObject that matches the widget's type or default to 'unknown'
    TypeObject selectedType = types.firstWhere(
      (type) => type.name == widget.type,
      orElse: () => types.firstWhere((type) => type.name == 'unknown'),
    );

    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TypePkmnList(type: selectedType.name),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedType.color,
      ),
      child: Text(
        selectedType.name[0].toUpperCase() + selectedType.name.substring(1),
        style: TextStyle(color: Colors.white, fontSize: widget.fontSize),
      ),
    );
  }
}
