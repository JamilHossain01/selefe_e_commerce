class CategoryModel {
  final int id;
  final String name;
  final String image;
  final int discount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.discount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      discount: json['discount'] ?? 0, // Default to 0 if discount is missing
    );
  }
}
