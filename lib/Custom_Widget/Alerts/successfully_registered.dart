import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class SuccessfullyRegisteredPopup extends StatelessWidget {
  const SuccessfullyRegisteredPopup({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var borderRadius = BorderRadius.circular(8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.only(
              top: screenHeight * 0.04, bottom: screenHeight * 0.05),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: AppColors.green,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset('images/Group 33528.png'),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Registered Successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.02, bottom: screenHeight * 0.04),
          child: Column(
            children: [
              Text(
                'Congratulations, $name',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                'You\'ve successfully created your\nprofile at Hiremi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: borderRadius,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      SlidePageRoute(page: const LogIn()),
                    );
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
