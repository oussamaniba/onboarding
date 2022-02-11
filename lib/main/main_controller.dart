import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:onboarding/utils/globals.dart';
import 'package:onboarding/utils/values.dart';

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

  RxBool isSignin = false.obs;
  Future<Map<String, dynamic>> signIn(String username, String password) async {
    isSignin.value = true;
    update();

    Map<String, dynamic> user = {};

    user = users.firstWhere(
      (element) =>
          (element['username'] as String) == username &&
          (element['password'] as String) == password,
      orElse: () => {},
    );

    await Future.delayed(const Duration(seconds: 3));
    String reason = '';
    isSignin.value = false;

    if (user.isNotEmpty) {
      if (user['status'] == true) {
        update();
        return {
          'status': true,
          'reason': 'Welcome, $username',
        };
      } else {
        update();
        return {
          'status': false,
          'reason': 'This account has been deactivated',
        };
      }
    } else {
      update();
      return {
        'status': false,
        'reason': 'This username or password does not exist',
      };
    }
  }

  @override
  void onInit() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    await Future.delayed(const Duration(seconds: 3));
    if (!firstRun) {
      Get.offAndToNamed('/signin');
    } else {
      Get.offAndToNamed('/');
    }
    super.onInit();
  }
}
