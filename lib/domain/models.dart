class Character {
  final int id;
  final String name;
  final String imageUrl;
  Character({required this.id, required this.name, required this.imageUrl});
  factory Character.fromJson(Map<String, dynamic> json) =>
      Character(id: json["id"], name: json["name"], imageUrl: json["image"]);
}
