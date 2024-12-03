import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:selefe_e_commerce/widgets/category_card.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/products';

  static Future<List<ProductModel>> fetchProducts(int page, int limit) async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl?offset=${page * limit}&limit=$limit'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

// Existing Product fetching logic...

  static Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
