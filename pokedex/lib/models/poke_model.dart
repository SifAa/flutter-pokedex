class Pokemon {
  int id;
  String name;
  String img;
  String url;

  Pokemon.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        img = data['img'],
        url = data['url'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'img': img, 'url': url};
}
