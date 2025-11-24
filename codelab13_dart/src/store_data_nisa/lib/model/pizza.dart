class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json['id']?.toString() ?? '') ?? 0;

    final rawName = json['pizzaName']?.toString() ?? '';
    final pizzaName = rawName.trim().isEmpty ? 'No name' : rawName;

    final rawDescription = json['description']?.toString() ?? '';
    final description = rawDescription.trim().isEmpty ? 'No description' : rawDescription;

    final price = double.tryParse(json['price']?.toString() ?? '') ?? 0.0;

    final imageUrl = json['imageUrl']?.toString() ?? '';

    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }

  factory Pizza.fromJsonSafe(Map<String, dynamic> json) {
    final id = int.tryParse(json['id']?.toString() ?? '') ?? 0;
    final rawName = json['pizzaName']?.toString() ?? '';
    final pizzaName = rawName.trim().isEmpty ? 'No name' : rawName;
    final rawDescription = json['description']?.toString() ?? '';
    final description = rawDescription.trim().isEmpty ? 'No description' : rawDescription;
    final price = double.tryParse(json['price']?.toString() ?? '') ?? 0.0;
    final imageUrl = json['imageUrl']?.toString() ?? '';

    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}