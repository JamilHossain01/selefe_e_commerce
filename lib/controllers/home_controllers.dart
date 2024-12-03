import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:selefe_e_commerce/views/product_list_screen.dart';

import '../views/category_list_screen.dart';

class HomeController extends GetxController {
  // Observable variable for the selected index
  var selectedIndex = 0.obs;

  // List of screens
  final List<Widget> screens = [
    const ProductListScreen(),
    const CategoryListScreen(),
  ];

  // Method to change the selected index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
