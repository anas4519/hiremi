//@dart=2.15
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/ThirdLandingPage.dart';

class Seceondlandingpage extends StatefulWidget {
  const Seceondlandingpage({Key? key}) : super(key: key);

  @override
  State<Seceondlandingpage> createState() => _SeceondlandingpageState();
}

class _SeceondlandingpageState extends State<Seceondlandingpage> {
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
              SlidePageRoute(page: const ThirdLandingPage()),
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
                      'images/onboarding-Discover.png',
                      width: imageSizeWidth,
                      height: imageSizeHeight,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.095),
        
                  const Text("Get Personalized", style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),),
                  const Text("Career Guidance.", style: TextStyle(
                    fontSize: 28.0,
                    color:Color(0xFF34AD78),
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const Text("Receive tailored advice and insights to help you make the\nbest decisions for your career.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1235),
                  CustomElevatedButton(
                    text: 'Next  >',
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(page: const ThirdLandingPage()),
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
