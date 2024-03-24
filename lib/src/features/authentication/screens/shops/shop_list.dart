import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/common_widgets/appbar/appbar.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text("Shops"),
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: Icon(Iconsax.arrow_left),
      //     onPressed: () {},
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // Appbar
              MessAppBar(
                showBackArrow: false,
                title: Text("Shops"),
              ),
              //   Shop Categories
              MessCardHorizontal(
                  imagePath: messJuiceCorner,
                  title: "Juice Corner",
                  subtitle: "Fresh Flavors, Morning Zest"),
              MessCardHorizontal(
                  imagePath: messPizzaShop,
                  title: "Slice of Heaven",
                  subtitle: "Where Every Slice is a Delight"),
              MessCardHorizontal(
                  imagePath: messAmulShop,
                  title: "Dairy Delights",
                  subtitle: "Indulge in the Creaminess"),
            ],
          ),
        ),
      ),
    );
  }
}

class MessCardHorizontal extends StatelessWidget {
  const MessCardHorizontal({
    super.key,
    required this.imagePath, // Add an imagePath parameter for the image
    required this.title, // Add a title parameter
    required this.subtitle, // Add a subtitle parameter
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity * 0.8,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFA8CD9F),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image on the left side
              Image.asset(
                imagePath,
                width: 155, // Half of the container width
                fit: BoxFit.cover,
              ),
              // Shop title and subtitle on the right side
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
