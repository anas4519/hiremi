import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class VerifiedPopup extends StatelessWidget {
  const VerifiedPopup({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(top: screenHeight*0.04, bottom: screenHeight*0.05),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Colors.green,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset('images/Group 33528.png'),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Congratulations!',
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
          padding: EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.04),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your App ID is ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'HM 23458 73432',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                'Additional benefits are unlocked,\nIndependently Explore Hiremi.',
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
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Explore Hiremi',
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