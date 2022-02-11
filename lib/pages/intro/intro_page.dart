import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/main/main_controller.dart';
import 'package:onboarding/pages/intro/widgets/bottom_page_controller.dart';
import 'package:onboarding/pages/intro/widgets/onboard_screen.dart';
import 'package:onboarding/utils/globals.dart';
import 'package:onboarding/utils/values.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (i) {
                      controller.updatePosition(i, false);
                    },
                    children: List.generate(
                      onboardScreen.length,
                      (index) => OnBoardScreen(
                        screen: onboardScreen[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: SmoothPageIndicator(
                    controller: pageController, // PageController
                    count: onboardScreen.length,
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey.withOpacity(.4),
                      activeDotColor: Colors.blue[900]!,
                    ), // your preferred effect
                    onDotClicked: (index) {},
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomController(
            isLoginScreen:
                controller.position.value + 1 == onboardScreen.length,
            onNext: () {
              controller.updatePosition(pageController.page!.toInt() + 1, true);
            },
            onSkip: () {
              controller.updatePosition(onboardScreen.length, true);
            },
            onSign: () {
              Get.toNamed('signin');
            },
          ),
        );
      },
    );
  }
}
