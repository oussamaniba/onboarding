import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onboarding/main/main_controller.dart';
import 'package:onboarding/pages/intro/widgets/onboard_screen.dart';
import 'package:onboarding/utils/globals.dart';
import 'package:onboarding/utils/values.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: PageView(
                    controller: pageController,
                    children: List.generate(
                      onboardScreen.length,
                      (index) => OnBoardScreen(
                        screen: onboardScreen[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
