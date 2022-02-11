import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/main/main_binding.dart';
import 'package:onboarding/pages/intro/intro_page.dart';
import 'package:onboarding/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      initialRoute: '/',
      color: Colors.white,
      getPages: [
        GetPage(
          name: '/',
          page: () => IntroPage(),
        ),
        GetPage(
          name: '/signin',
          page: () => SignInPage(),
        ),
      ],
    );
  }
}
