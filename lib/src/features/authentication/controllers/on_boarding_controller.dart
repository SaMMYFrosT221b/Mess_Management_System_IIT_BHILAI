import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController{
  final pageController = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: messOnBoardingImage1,
          title: messOnBoardingTitle1,
          subTitle: messOnBoardingSubTitle1,
          counterText: messOnBoardingCounter1,
          bgColor: messOnBoardingPage1Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: messOnBoardingImage2,
          title: messOnBoardingTitle2,
          subTitle: messOnBoardingSubTitle2,
          counterText: messOnBoardingCounter2,
          bgColor: messOnBoardingPage2Color),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: messOnBoardingImage3,
          title: messOnBoardingTitle3,
          subTitle: messOnBoardingSubTitle3,
          counterText: messOnBoardingCounter3,
          bgColor: messOnBoardingPage3Color),
    )
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
  animateToNextSlide(){
    int nextPage = pageController.currentPage+1;
    pageController.animateToPage(page: nextPage);
  }
  skip() => pageController.jumpToPage(page: 2);
}