class Repository {
  final String name;
  final String description;
  final String owner;

  Repository({required this.name, required this.description, required this.owner});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      description: json['description'] ?? 'No description available.',
      owner: json['owner']['login'],
    );
  }
}
