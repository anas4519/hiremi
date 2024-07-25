import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/custom_alert_2.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
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
                      image:
                          const AssetImage('images/Contact us-cuate (1).png'))),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          const Expanded(
                            child: Text(
                              '+91 89 7845 4512',
                              style: TextStyle(
                                  color: Color(0xFFC1272D),
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow
                                  .ellipsis, // Ensure text does not overflow
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
                        const Expanded(
                          child: Text(
                            'www.hiremi.in',
                            style: TextStyle(
                                color: Color(0xFFC1272D),
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow
                                .ellipsis, // Ensure text does not overflow
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          const Expanded(
                            child: Text(
                              'hiremi@support.com',
                              style: TextStyle(
                                  color: Color(0xFFC1272D),
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow
                                  .ellipsis, // Ensure text does not overflow
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: screenHeight*0.05,),
              Container(
                height: 160,
                width: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Describe Your Issue (Optional)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        maxLines: 5,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return //CustomAlertBox();

                                  const CustomAlert2();
                            },
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFFC1272D)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                        child: const Text(
                          'Send Problem',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
