class ProductModel {
  final int? id;
  final String title;
  final double price;
  final String image;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price']?.toDouble() ?? 0.0,
      image: (json['images'] as List).isNotEmpty ? json['images'][0] : '',
    );
  }
}
