class Activity {
  const Activity({required this.name, this.description, this.imageUrl});

  final String name;
  final String? description;
  final String? imageUrl;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
