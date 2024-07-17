import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const Color customRed = Color(0xFFC1272D);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const NotificationScreen(),
              ));
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info section
              const VerifiedProfileWidget(
                  name: 'Harsh Pawar', appId: 'HM 23458 73432'),
              SizedBox(height: screenHeight * 0.02),
              // Account section
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                padding:  EdgeInsets.all(screenWidth*0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight*0.01),
                ),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: screenHeight * 0.03,
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      Text(
                        'Personal Information',
                        style: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: screenHeight * 0.02,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            WidgetStatePropertyAll(AppColors.bgBlue)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Text(
                'Privacy & Security',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight*0.01),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.folder_shared_rounded,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'Manage Permission',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_open_rounded,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'Notification',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: false,
                                onChanged: (value) {},
                                activeColor: customRed,
                                activeTrackColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: true,
                                onChanged: (value) {},
                                activeColor: customRed,
                                activeTrackColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Text(
                'About & More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight*0.01),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth*0.04),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'About Us',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              'Help & Support',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}