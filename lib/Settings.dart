import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Help_Support.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/about_us.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String FullName = "";
  String storedEmail = "";
  @override
  void initState() {
    super.initState();

    fetchAndSaveFullName();
    _printSavedEmail();
  }

  Future<void> _printSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'No email saved';
    print(email);
    storedEmail = email;
  }

  Future<void> fetchAndSaveFullName() async {
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        storedEmail = prefs.getString('email') ?? 'No email saved';

        for (var user in data) {
          if (user['email'] == storedEmail) {
            setState(() {
              FullName = user['full_name'] ?? 'No name saved';
            });
            await prefs.setString('full_name', FullName);
            print('Full name saved: $FullName');
            break;
          }
        }

        if (FullName.isEmpty) {
          print('No matching email found');
        }
      } else {
        print('Failed to fetch full name');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const Color customRed = Color(0xFFC1272D);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info section
              VerifiedProfileWidget(name: FullName, appId: 'HM 23458 73432'),
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
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewNavbar(
                                initTabIndex: 3,
                              )),
                      (Route<dynamic> route) => false,
                    );
                  },
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
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewNavbar(
                                      initTabIndex: 3,
                                    )),
                            (Route<dynamic> route) => false,
                          );
                        },
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
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
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
                            Spacer(),
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
                            Spacer(),
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
                            Spacer(),
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
                            Spacer(),
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
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const About_Us()));
                        },
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
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const About_Us()));
                              },
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const HelpSupport()));
                        },
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
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const HelpSupport()));
                              },
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
