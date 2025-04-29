class Shop {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double value;
  final String type;

  Shop({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.value,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'value': value,
      'type': type,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      description: map['description'],
      value: (map['value'] as num).toDouble(),
      type: map['type'],
    );
  }
}
