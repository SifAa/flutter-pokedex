import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedetail_api.dart';
import 'package:pokedex/models/poke_detail_model.dart';
// import widgets here
import 'package:pokedex/widgets/details/detail_type_buttons.dart';
import 'package:pokedex/widgets/details/detail_sprite_image.dart';
import 'package:pokedex/widgets/details/detail_stat_table.dart';

class DetailData extends StatefulWidget {
  final int id;

  const DetailData({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  bool _isLoading = true;
  late PokemonDetail _pokemon;

  @override
  void initState() {
    super.initState();
    _fetchPokemonDetails();
  }

  Future<void> _fetchPokemonDetails() async {
    final response = await PokeDetailAPI.getPkmn(widget.id);
    final responseData = jsonDecode(response.body);

    final baseStatsData = responseData['stats'] as List<dynamic>;
    final baseStats = BaseStats.fromJsonList(baseStatsData);

    final p = PokemonDetail.fromJson(responseData, baseStats);
    setState(() {
      _pokemon = p;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator() // Show loading indicator while fetching data
        : Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(71),
                topRight: Radius.circular(71),
              ),
            ),
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 500,
            ),
            child: Column(
              children: [
                const SizedBox(
                    height: 16), // Add spacing between name and buttons
                typeButtons(_pokemon.types),
                baseStatsTable(_pokemon.baseStats),
                spriteImages(_pokemon.sprites),
              ],
            ),
          );
  }
}
// DraggableScrollableSheet?