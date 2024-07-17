import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verify.dart';


class CustomAlertbox extends StatefulWidget {
  const CustomAlertbox({Key? key}) : super(key: key);

  @override
  State<CustomAlertbox> createState() => _CustomAlertboxState();
}

class _CustomAlertboxState extends State<CustomAlertbox> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: screenWidth * 0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: screenWidth * 0.032,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                 const Expanded(child: Divider(height: 1,)),
                  Icon(
                    Icons.error_rounded,
                    color: const Color(0xFFC1272D),
                    size: screenWidth * 0.105,
                  ),
                  const Expanded(child: Divider(height: 1,)),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const Text(
                'Please, Review & Verify Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  color: Colors.green[100],
                ),
                child: const Center(
                  child: Text(
                    'Additional Benefits will be unlocked once Verification Payment Completed.',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.04,
          color: const Color(0xFFC1272D),
          child: const Center(
            child: Text(
              '₹ 1000 / Life Time Subscription',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 11.42),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Center(
          child: Column(
            children: [
              const Text(
                'Note: Verification is mandatory for\nspecial content access.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  color: Colors.green,
                ),
                child: TextButton(
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const VerificationScreen()));
                  },
                  child: const Text(
                    'Review & Verify Now >',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
