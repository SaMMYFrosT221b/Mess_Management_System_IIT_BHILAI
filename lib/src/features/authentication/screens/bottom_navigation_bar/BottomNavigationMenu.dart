import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/features/authentication/screens/feedback/feedback_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/home_screen/HomeScreen.dart';
import 'package:mess_management_system/src/features/authentication/screens/mess_menu/mess_menu_day_wise.dart';
import 'package:mess_management_system/src/features/authentication/screens/profile/profile.dart';
import 'package:mess_management_system/src/features/authentication/screens/shops/shop_list.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
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
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(
                icon: Icon(Iconsax.folder_open), label: 'Menu'),
            NavigationDestination(
                icon: Icon(Iconsax.finger_scan), label: 'Feedback'),
            NavigationDestination(
                icon: Icon(Iconsax.personalcard), label: 'Profile'),
          ],
        ),
      ),
      body: SafeArea(
          child: Obx(() => controller.screens[controller.selectedIndex.value])),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    ShopList(),
    MessMenuScreenDayWise(),
    FeedbackForm(),
    ProfilePage(
      name: "Ratnakar Gautam",
      email: "ratnakarg@iitbhilai.ac.in",
      idNo: "12141360",
      contactNumber: "+91 9044906728",
      whichMess: "Kumar Mess",
    ),
  ];
}
