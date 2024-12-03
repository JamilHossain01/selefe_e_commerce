import 'package:get/get.dart';
import '../models/category_model.dart';
import '../services/api_services.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      isError.value = false;

      final data = await ApiService.fetchCategories();
      categories.assignAll(data);
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
