

class Plant {
  const Plant({
    this.imagePath,
    required this.id,
    required this.name,
    required this.sciname,
    required this.season,
    required this.description,
    required this.instructions,
    required this.isFavorite
   });
   
  final String? imagePath;
  final String id;
  final String name;
  final String sciname;
  final String season;
  final String description;
  final String instructions;
  final bool isFavorite;
}
