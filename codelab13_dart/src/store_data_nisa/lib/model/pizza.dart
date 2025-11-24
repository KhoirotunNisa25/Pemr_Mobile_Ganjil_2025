const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDescription = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';
// small helpers to keep parsing logic DRY and consistent
String _nonEmptyString(dynamic v, String fallback) {
  final s = v?.toString() ?? '';
  return s.trim().isEmpty ? fallback : s;
}

int _parseInt(dynamic v) => int.tryParse(v?.toString() ?? '') ?? 0;

double _parseDouble(dynamic v) => double.tryParse(v?.toString() ?? '') ?? 0.0;

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
    return Pizza(
      id: _parseInt(json[keyId]),
      pizzaName: _nonEmptyString(json[keyName], 'No name'),
      description: _nonEmptyString(json[keyDescription], 'No description'),
      price: _parseDouble(json[keyPrice]),
      imageUrl: json[keyImage]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}