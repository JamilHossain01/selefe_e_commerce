import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;
  var isGridView = false.obs;
  var currentPage = 0.obs;
  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage.value = 0;
      products.clear();
    }

    try {
      isLoading.value = true;
      isError.value = false;

      final data = await ApiService.fetchProducts(currentPage.value, limit);
      products.addAll(data);

      currentPage.value++;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
