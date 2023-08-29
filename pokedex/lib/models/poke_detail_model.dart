class PokemonDetail {
  int id;
  String name;
  List<Sprites> sprites;
  List<String> types;
  int height;
  int weight;
  BaseStats baseStats;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
    required this.height,
    required this.weight,
    required this.baseStats,
  });

  factory PokemonDetail.fromJson(
      Map<String, dynamic> data, BaseStats baseStats) {
    final spriteData = data['sprites'] as Map<String, dynamic>;
    final sprites = [
      Sprites(
        normal: spriteData['front_default'],
        shiny: spriteData['front_shiny'],
        name: 'normal sprite', // Set the name for normal sprite
      ),
      Sprites(
        normal: spriteData['front_shiny'],
        shiny: spriteData['front_shiny'],
        name: 'shiny sprite', // Set the name for shiny sprite
      ),
      // Add more sprite variations if needed
    ];

    List<String> types = List<String>.from(
        data['types'].map((type) => type['type']['name']).toList());

    return PokemonDetail(
      id: data['id'],
      name: data['name'],
      sprites: sprites,
      types: types,
      height: data['height'],
      weight: data['weight'],
      baseStats: baseStats,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sprites': sprites.map((sprite) => sprite.toJson()).toList(),
        'types': types,
      };
}

class Sprites {
  String normal;
  String shiny;
  String name; // Add name property

  Sprites({
    required this.normal,
    required this.shiny,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'normal': normal,
        'shiny': shiny,
        'name': name,
      };
}

class BaseStats {
  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  BaseStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory BaseStats.fromJsonList(List<dynamic> data) {
    final statMap = {
      'hp': 0,
      'attack': 1,
      'defense': 2,
      'special-attack': 3,
      'special-defense': 4,
      'speed': 5,
    };

    final stats = List<int>.filled(6, 0);

    for (final statData in data) {
      final baseStat = statData['base_stat'] as int;
      final statName = statData['stat']['name'] as String;
      final statIndex = statMap[statName]!;
      stats[statIndex] = baseStat;
    }

    return BaseStats(
      hp: stats[0],
      attack: stats[1],
      defense: stats[2],
      spAttack: stats[3],
      spDefense: stats[4],
      speed: stats[5],
    );
  }
}
