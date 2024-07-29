import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verify.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({super.key, required this.isVerified, required this.image});

  final String image;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          !isVerified
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const VerificationScreen()))
              : null;

          ///  TODO :Navigate to Mentor Screen
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
