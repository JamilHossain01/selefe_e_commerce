import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selefe_e_commerce/controllers/home_controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        // Use Obx to listen for changes in selectedIndex and update the UI
        return controller.screens[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        // Listen to the selected index changes for the BottomNavigationBar
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
          ],
        );
      }),
    );
  }
}
