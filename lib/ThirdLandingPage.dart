import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdLandingPage extends StatelessWidget {
  const ThirdLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSizeWidth = MediaQuery.of(context).size.width;
    double imageSizeHeight = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) async {
          if (details.primaryDelta! < -10) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('onBoardingComplete', 'true');
            Navigator.push(
              context,
              SlidePageRoute(page: const LogIn()),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Center(
                    child:   Image.asset(
                      'images/onboarding-Personalized.png',
                      width: imageSizeWidth,
                      height: imageSizeHeight,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.095),
        
                  const Text("Get Personalized ", style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),),
                  const Text("Career Guidance.", style: TextStyle(
                    fontSize: 28.0,
                    color:Color(0xFF34AD78),
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const Text("Receive tailored advice and insights to help you make the best hiring decisions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1235),
                  CustomElevatedButton(
                    text:  "Let's Get Started",
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('onBoardingComplete', 'true');
                      prefs.setBool('isFirstComplete', false);
                      Navigator.push(
                        context,
                        SlidePageRoute(page: const LogIn()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
