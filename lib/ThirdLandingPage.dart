import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    child: Image.asset(
                      'images/onboarding-Personalized.png',
                      width: imageSizeWidth,
                      height: imageSizeHeight,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.095),

                  const Text(
                    "Discover Exclusive ",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Opportunities",
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Color(0xFF34AD78),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.06),
                    child: const Text(
                      "Get personalized job and internship opportunities in various domains tailored to your skills.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1235),
                  // CustomElevatedButton(
                  //   text:  "Let's Get Started",
                  //   onPressed: () async {
                  //     final prefs = await SharedPreferences.getInstance();
                  //     await prefs.setString('onBoardingComplete', 'true');
                  //     prefs.setBool('isFirstComplete', false);
                  //     Navigator.push(
                  //       context,
                  //       SlidePageRoute(page: const LogIn()),
                  //     );
                  //   },
                  // ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.84, // Default width
                    height: MediaQuery.of(context).size.height *
                        0.065, // Default height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC1272D), // Default color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('onBoardingComplete', 'true');
                        prefs.setBool('isFirstComplete', false);
                        Navigator.push(
                          context,
                          SlidePageRoute(page: const LogIn()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Let's Get Stared", style: TextStyle(color: Colors.white),),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                          const Icon(Icons.run_circle, color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
