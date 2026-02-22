final class Product {
  final int? id;
  final String? name;
  final double? price;

  const Product({
    this.id,
    this.name,
    this.price,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}
