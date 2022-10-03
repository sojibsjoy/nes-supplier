import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigating();
  }

  void navigating() async {
    if (Preference.getLoggedInFlag()) {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAllNamed(HomeScreen.routeName),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAllNamed(LoginScreen.routeName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/imgs/shadow_logo.png',
                height: 350.h,
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/imgs/logo.png',
                height: 200.h,
                fit: BoxFit.fitHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
