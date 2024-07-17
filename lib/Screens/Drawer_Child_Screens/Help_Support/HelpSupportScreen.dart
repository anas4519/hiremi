import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/custom_alert_2.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key, });

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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const NotificationScreen()));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.03),
          child: Column(
            children: [
              const Center(
                  child: Image(
                      image: AssetImage(
                          'images/Contact us-cuate (1).png'))),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
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
                              return const CustomAlert2();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
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
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Row(
                children: [
                  Container(
                    height: screenHeight * 0.002,
                    width: screenWidth * 0.390,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  const Text('or', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Container(
                    height: screenHeight * 0.002,
                    width: screenWidth * 0.390,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.call, color: Color(0xFFC1272D),),
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
                              color: Color(0xFFC1272D), fontWeight: FontWeight.bold),
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
                    const Icon(Icons.public, color: Color(0xFFC1272D),),
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
                            color: Color(0xFFC1272D), fontWeight: FontWeight.bold),
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
                      const Icon(Icons.send, color: Color(0xFFC1272D),),
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
                              color: Color(0xFFC1272D), fontWeight: FontWeight.bold),
                          overflow: TextOverflow
                              .ellipsis, // Ensure text does not overflow
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Container(
                height: screenHeight * 0.002,
                width: screenWidth * 0.900,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}