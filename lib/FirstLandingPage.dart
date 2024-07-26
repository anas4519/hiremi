import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/SeceondLandingpage.dart';

class FirstLandingPage extends StatefulWidget {
  const FirstLandingPage({Key? key}) : super(key: key);

  @override
  State<FirstLandingPage> createState() => _FirstLandingPageState();
}

class _FirstLandingPageState extends State<FirstLandingPage> {
  @override
  Widget build(BuildContext context) {
    double imageSizeWidth = MediaQuery.of(context).size.width;
    double imageSizeHeight = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! < -10) {
            Navigator.push(
              context,
              SlidePageRoute(page: const Seceondlandingpage()),
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
                      'images/onboarding-Welcome.png',
                      width: imageSizeWidth,
                      height: imageSizeHeight,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.095),
                  const Text.rich(
                    TextSpan(
                      text: '   Nice to see you,\nWelcome to ',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Hiremi.',
                          style: TextStyle(
                            color: Color(0xFFC1272D), // Set the color of "Hiremi" to red
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Where your career needs are at your fingertips.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1235),
                  CustomElevatedButton(
                    text: 'Next  >',
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(page: const Seceondlandingpage()),
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
