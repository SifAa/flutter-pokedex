import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_detail_model.dart';

// TODO: make table nicer looking

Widget baseStatsTable(BaseStats baseStats) {
  final baseStatsEntries = [
    MapEntry('HP', baseStats.hp),
    MapEntry('Attack', baseStats.attack),
    MapEntry('Defense', baseStats.defense),
    MapEntry('Special Attack', baseStats.spAttack),
    MapEntry('Special Defense', baseStats.spDefense),
    MapEntry('Speed', baseStats.speed),
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Table(
      border: TableBorder.all(color: Colors.grey),
      children: baseStatsEntries.map((entry) {
        final statName = entry.key;
        final statValue = entry.value;
        return TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  statName.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(statValue.toString()),
              ),
            ),
          ],
        );
      }).toList(),
    ),
  );
}
