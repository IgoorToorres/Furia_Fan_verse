class News {
  final String id;
  final String imageUrl;
  final String titleNews;
  final String description;
  final String game;

  News({
    required this.id,
    required this.imageUrl,
    required this.titleNews,
    required this.description,
    required this.game,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'titleNews': titleNews,
      'description': description,
      'game': game,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      imageUrl: map['imageUrl'],
      titleNews: map['titleNews'],
      description: map['description'],
      game: map['game'],
    );
  }
}
