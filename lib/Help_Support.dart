import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/custom_alert_2.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Help & Support",
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
            child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                          child: Image(
                              image: const AssetImage(
                                  'images/Contact us-cuate (1).png'))),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Text(
                        'Got App Related Query?',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF41485E),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: Color(0xFFC1272D),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  const Text(
                                    'Phone:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        final Uri phoneLaunchUri = Uri(
                                          scheme: 'tel',
                                          path: '+91 8978454512',
                                        );
                                        if (!await launchUrl(phoneLaunchUri)) {
                                          throw Exception(
                                              'Could not launch $phoneLaunchUri');
                                        }
                                      },
                                      child: const Text(
                                        '+91 89 7845 4512',
                                        style: TextStyle(
                                            color: Color(0xFFC1272D),
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow
                                            .ellipsis, // Ensure text does not overflow
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.public,
                                  color: Color(0xFFC1272D),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.04,
                                ),
                                const Text(
                                  'Website: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      _launchURL('http://www.hiremi.in/');
                                    },
                                    child: const Text(
                                      'www.hiremi.in',
                                      style: TextStyle(
                                          color: Color(0xFFC1272D),
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow
                                          .ellipsis, // Ensure text does not overflow
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.send,
                                    color: Color(0xFFC1272D),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  const Text(
                                    'Email:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: 'hiremi@support.com',
                                            query:
                                                'subject=Support Request&body=Hello, I need help with...');
                                        if (!await launchUrl(emailLaunchUri)) {
                                          throw Exception(
                                              'Could not launch $emailLaunchUri');
                                        }
                                      },
                                      child: const Text(
                                        'hiremi@support.com',
                                        style: TextStyle(
                                            color: Color(0xFFC1272D),
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow
                                            .ellipsis, // Ensure text does not overflow
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ]))));
  }
}
