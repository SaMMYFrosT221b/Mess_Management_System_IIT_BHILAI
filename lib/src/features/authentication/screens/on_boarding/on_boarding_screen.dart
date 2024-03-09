import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:mess_management_system/src/features/authentication/models/model_on_boarding.dart';
import 'package:mess_management_system/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
  final pageController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: pageController.pageController,
            onPageChangeCallback: pageController.onPageChangeCallback,
            pages: pageController.pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => pageController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: messDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () => pageController.skip(),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey),
                )),
          ),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: pageController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}