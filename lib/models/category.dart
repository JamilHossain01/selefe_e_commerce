import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Category model
class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  // Factory constructor to parse the response
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

// Controller to handle API request
class CategoryController extends GetxController {
  var category = Rxn<Category>(); // Rxn for nullable type

  // Fetch category by ID
  Future<void> fetchCategory(int id) async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/categories/$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the response
        category.value = Category.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load category');
      }
    } catch (e) {
      print("Error fetching category: $e");
    }
  }
}
