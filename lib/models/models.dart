// Modelo de dados para as plantas
class Plant {
  const Plant({
    this.imagePath,
    required this.id,
    required this.name,
    required this.sciname,
    required this.season,
    required this.description,
    required this.instructions,
    required this.isFavorite,
  });

  final String? imagePath;
  final String id;
  final String name;
  final String sciname;
  final String season;
  final String description;
  final String instructions;
  final bool isFavorite;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sciname': sciname,
      'season': season,
      'description': description,
      'instructions': instructions,
      'isFavorite': isFavorite,
      'imagePath': imagePath,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      sciname: map['name'] ?? '',
      season: map['season'] ?? '',
      description: map['description'] ?? '',
      instructions: map['instructions'] ?? '',
      isFavorite: map['isFavorite'] ?? '',
      imagePath: map['imagePath'],
    );
  }
}
