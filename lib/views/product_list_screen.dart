import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
                controller.isGridView.value ? Icons.list : Icons.grid_view)),
            onPressed: () => controller.isGridView.toggle(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.isError.value) {
          return Center(
            child: ElevatedButton(
              onPressed: controller.fetchProducts,
              child: const Text('Retry'),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(isRefresh: true),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isGrid = controller.isGridView.value;
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      isGrid ? (constraints.maxWidth > 600 ? 4 : 2) : 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: isGrid ? 0.8 : 3.0,
                ),
                itemCount: controller.products.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.products.length) {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SizedBox.shrink();
                  }

                  final product = controller.products[index];
                  return ProductCard(product: product);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
