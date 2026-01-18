class UserProfile {
  final String name;
  final String email;
  final String photoPath;
  final bool ativarGridView;

  UserProfile({
    required this.name,
    required this.photoPath,
    required this.email,
    this.ativarGridView = false,
  });
}
