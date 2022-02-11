import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onboarding/utils/globals.dart';

class MainController extends GetxController {
  RxInt position = 0.obs;
  updatePosition(int i) {
    position.value = i;
    pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 250),
      curve: Curves.bounceInOut,
    );
    update();
  }
}
