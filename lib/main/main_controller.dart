import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onboarding/utils/globals.dart';

class MainController extends GetxController {
  RxInt position = 0.obs;
  updatePosition(int i, bool apply) {
    position.value = i;
    if (apply) {
      pageController.animateToPage(
        i,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
    update();
  }
}
