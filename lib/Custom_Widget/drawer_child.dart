import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/Forget_Your_Password.dart';
import 'package:hiremi_version_two/Help_Support.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Profile_Screen.dart';
import 'package:hiremi_version_two/Settings.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/about_us.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:hiremi_version_two/repository/User.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/colors.dart';

class DrawerChild extends ConsumerStatefulWidget {
  const DrawerChild({super.key});

  @override
  ConsumerState<DrawerChild> createState() => _DrawerChildState();
}

class _DrawerChildState extends ConsumerState<DrawerChild> {
  String storedEmail = "";

  @override
  void initState() {
    super.initState();

    _printSavedEmail();
  }

  Future<void> _printSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'No email saved';
    print(email);
    storedEmail = email;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isVerified = ref.watch(verificationProvider);

    void showPopUp() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: const CustomAlertbox());
        },
      );
    }

    return Drawer(
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenWidth * 0.04,
            screenWidth * 0.04, screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: screenWidth * 0.10,
                    lineWidth: 4,
                    percent: isVerified ? 1 : 0.25,
                    center: isVerified ? const Text('100%') : const Text('25%'),
                    progressColor: Colors.green,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    userRepository.currentUser!.fullName,
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  if (!isVerified)
                    Container(
                      height: screenHeight * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.1),
                        border: Border.all(color: const Color(0xFFC1272D)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: const Color(0xFFC1272D),
                              size: screenWidth * 0.02,
                            ),
                            Text(
                              ' Not verified',
                              style: TextStyle(
                                  color: const Color(0xFFC1272D),
                                  fontSize: screenWidth * 0.02),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (isVerified)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.responsiveVerticalSpace(context),
                        horizontal: Sizes.responsiveHorizontalSpace(context),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 0.7,
                            color: AppColors.green,
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'images/icons/verified.png',
                            height: MediaQuery.of(context).size.width * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: Sizes.responsiveXs(context),
                          ),
                          Text(
                            'Verified',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Last updated today',
                    style: TextStyle(
                        fontSize: screenWidth * 0.02, color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextButton(
                    onPressed: () {
                      if (!isVerified) {
                        showPopUp();
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const ProfileScreen()));
                      }
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFFC1272D)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.01),
                        ),
                      ),
                    ),
                    child: Text(
                      'Edit Profile >',
                      style: TextStyle(fontSize: screenWidth * 0.02),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.9,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: screenHeight * 0.04),
            ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const SettingsScreen())),
                leading: Container(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBEEEE),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xFFC1272D),
                  ),
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: screenWidth * 0.034),
                ),
                trailing: IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFECF5FF))),
                    onPressed: () {
                      if (!isVerified) {
                        showPopUp();
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const SettingsScreen()));
                      }
                    },
                    icon: const Icon(Icons.navigate_next))),
            SizedBox(height: screenHeight * 0.005),
            ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const Forget_Your_Password())),
                leading: Container(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBEEEE),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  child: const Icon(
                    Icons.lock_open_outlined,
                    color: Color(0xFFC1272D),
                  ),
                ),
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: screenWidth * 0.034),
                ),
                trailing: IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFECF5FF))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const Forget_Your_Password()));
                    },
                    icon: const Icon(Icons.navigate_next))),
            SizedBox(height: screenHeight * 0.005),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const About_Us())),
                leading: Container(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBEEEE),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  child: const Icon(
                    Icons.info,
                    color: Color(0xFFC1272D),
                  ),
                ),
                title: Text(
                  'About App',
                  style: TextStyle(fontSize: screenWidth * 0.034),
                ),
                trailing: IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFECF5FF))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const About_Us()));
                    },
                    icon: const Icon(Icons.navigate_next))),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const HelpSupport())),
                leading: Container(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBEEEE),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  child: const Icon(
                    Icons.support_agent_outlined,
                    color: Color(0xFFC1272D),
                  ),
                ),
                title: Text(
                  'Help and Support',
                  style: TextStyle(fontSize: screenWidth * 0.034),
                ),
                trailing: IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFECF5FF))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HelpSupport()));
                    },
                    icon: const Icon(Icons.navigate_next))),
            const Spacer(),
            ListTile(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('isLogin', 'false');
                  Get.delete<ProfileController>();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LogIn()),
                    (Route<dynamic> route) => false,
                  );
                },
                leading: Container(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBEEEE),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xFFC1272D),
                  ),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: screenWidth * 0.034),
                ),
                trailing: IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFECF5FF))),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      Get.delete<ProfileController>();
                      await prefs.setString('isLogin', 'false');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    icon: const Icon(Icons.navigate_next))),
          ],
        ),
      ),
    );
  }
}
