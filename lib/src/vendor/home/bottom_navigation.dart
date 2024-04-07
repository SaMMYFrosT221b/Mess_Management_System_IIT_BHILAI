import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/features/authentication/screens/profile/profile.dart';
import 'package:mess_management_system/src/vendor/home/foot_prediction.dart';
import 'package:mess_management_system/src/vendor/home/home.dart';
import 'package:mess_management_system/src/vendor/home/popular_dishes.dart';
import 'package:mess_management_system/src/vendor/home/todays_menu.dart';
import 'package:mess_management_system/src/vendor/home/vendor_menu_form.dart';

class VendorBottomNavigationMenu extends StatefulWidget {
  const VendorBottomNavigationMenu({super.key});

  @override
  State<VendorBottomNavigationMenu> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<VendorBottomNavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorNavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            print(controller.selectedIndex.value);
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.home_copy), label: 'Live Foot'),
            NavigationDestination(
                icon: Icon(Iconsax.shop_copy), label: 'Tod.. Menu'),
            NavigationDestination(
                icon: Icon(Iconsax.folder_open_copy), label: 'Menu Form'),
            NavigationDestination(
                icon: Icon(Iconsax.finger_scan_copy), label: 'Popular dish'),
            NavigationDestination(
                icon: Icon(Iconsax.personalcard_copy), label: 'Prediction'),
          ],
        ),
      ),
      body: SafeArea(
          child: Obx(() => controller.screens[controller.selectedIndex.value])),
    );
  }
}

class VendorNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    VendorHomePage(),
    VendorTodaysMenu(),
    MealApp(),
    PopularDish(),
    MessPredictor(),
  ];
}
