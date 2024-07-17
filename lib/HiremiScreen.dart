import 'package:flutter/material.dart';
import 'package:hiremi_version_two/FirstLandingPage.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiremiScreen extends StatelessWidget {
  const HiremiScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double imageSize = MediaQuery.of(context).size.width * 0.6;

    // Delayed navigation logic
    Future.delayed(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            if (prefs.getString('onBoardingComplete') == 'true') {
              if (prefs.getString('isLogin') == 'false') {
                return const LogIn();
              }
              else if (prefs.getString('isLogin') == 'true') {
                return const NewNavbar();
              }
            }
            return const FirstLandingPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/Hiremi_new_Icon.png',
          width: imageSize,
          height: imageSize,
        ),
      ),
    );
  }
}
