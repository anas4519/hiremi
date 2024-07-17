
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:http/http.dart' as http;
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
import 'package:hiremi_version_two/Verify_ur_Email.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Apis/api.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final UserService _userService = UserService();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> sendOTP(String email) async {
    setState(() {
      isLoading = true;
    });

    // Replace with your Django API endpoint URL
    var apiUrl = 'http://13.127.81.177:8000/forgot-password/';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        // Successful response, navigate to VerifyUrEmail screen
        Navigator.pushReplacement(
          context,
          SlidePageRoute(page: const VerifyUrEmail()),
        );
      } else {
        // Handle other status codes or errors
        debugPrint('Failed to send OTP: ${response.statusCode}');
        // Show error message to the user
      }
    } catch (e) {
      // Handle network or server errors
      print('Error sending OTP: $e');
      // Show error message to the user
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> storeCSRFToken(String csrfToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('csrfToken', csrfToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'images/Hiremi_new_Icon.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
              const Text(
                "Forget Your Password",
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "No worries, it happens!",
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Center(
                child: Image.asset(
                  'images/Forget_your_Password.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0),
              CurvedContainer(
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                borderWidth: 0.53,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0215,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.09,
                        ),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Enter Email Address",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: " *",
                                style: TextStyle(
                                  color: Colors.red,
                                ), // Red asterisk
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0115,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: CurvedTextField(
                          controller: emailController,
                          hintText: "youremail@gmail.com",
                          prefixIcon: Icons.account_circle,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //   return 'Please enter your email id';

                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0185,
                      ),
                      Container(

                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                              "Enter your email address to receive a ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "verification",
                              style: TextStyle(color: Colors.blue),
                            ), // Change text color to blue
                            TextSpan(
                              text: " code in\nyour mail box.",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0285,
                      ),
                      Center(
                        child: isLoading
                            ? CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Sending OTP...',
                          onPressed: () {},
                        )
                            : CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Send OTP',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> body = {"email": emailController.text.trim()};

                              final response = await _userService.createPostApi(body, ApiUrls.forgetPaassword);
                              if (response.statusCode == 200) {
                                String csrfToken = response.headers['set-cookie'] ?? '';
                                await storeCSRFToken(csrfToken);
                                Navigator.pushReplacement(
                                  context,
                                  SlidePageRoute(page: const VerifyUrEmail()),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0747,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70,)
            ],
          ),
        ),
      ),
    );
  }
}