import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class About_Us extends StatefulWidget {
  const About_Us({
    Key? key,
  }) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

// ignore: camel_case_types
class _About_UsState extends State<About_Us> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: Sizes.responsiveDefaultSpace(context)),
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgBlue,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const NotificationScreen(),
                      ));
                    },
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'images/Subscriber-bro.png',
                height: screenHeight * 0.400,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Image(image: AssetImage('images/main (1).png')),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'Elevate Your Career, Empower',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            Text(
              'Your Business',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              'Hiremi is a platform for career and business growth, offering',
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.5,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Text(
              'efficient recruitment solutions and development resources for ',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Text(
              'job seekers and recent graduates.',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              'With services in project management, recruitment outsourcing',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Text(
              'payroll, mentorship, and corporate training.',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            InkWell(
              onTap: () {
                _launchURL('http://www.hiremi.in/About%20Us%20page/about.html');
              },
              child: const Text(
                'Learn more',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: 2.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
