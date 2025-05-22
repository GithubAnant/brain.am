class Song {
  final String id;
  final String title;
  final String filePath;
  final String imagePath;
  final List<String> categories;
  final List<String> tags;
  final int neuralLevel;
  final int duration;

  Song({
    required this.id,
    required this.title,
    required this.filePath,
    required this.imagePath,
    required this.categories,
    required this.tags,
    required this.neuralLevel,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      filePath: json['filePath'],
      imagePath: json['imagePath'],
      categories: List<String>.from(json['categories']),
      tags: List<String>.from(json['tags']),
      neuralLevel: json['neuralLevel'],
      duration: json['duration'],
    );
  }
}