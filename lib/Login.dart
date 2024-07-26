import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Verify_ur_Email.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/Forget_Your_Password.dart';
import 'package:hiremi_version_two/Register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String? _savedEmail;
  bool isV = false;

  Future<String?> _printSavedEmail() async {
    // final prefs = await SharedPreferences.getInstance();
    // final email = prefs.getString('email') ?? 'No email saved';
    // print("email saved is $email");
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedEmail = prefs.getString('email') ?? 'No email saved';
    });

    print("Saved email is $_savedEmail");
    isV = await _isEmailVerified();
  }

  Future<bool> _isEmailVerified() async {
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {
        if (user['email'] == _savedEmail && user['verified'] == true) {
          print("Verified is true");
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setString('isLogin', 'true');
          Navigator.pushAndRemoveUntil(
            context,
            SlidePageRoute(page: NewNavbar()),
            (Route<dynamic> route) => false,
          );
          return true;
        }
      }
    }
    Navigator.pushAndRemoveUntil(
      context,
      SlidePageRoute(page: NewNavbar()),
      (Route<dynamic> route) => false,
    );
    return false;
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid inputs
      return;
    }

    const String apiUrl = "http://13.127.81.177:8000/login/";
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": _emailController.text,
        "password": _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful
      print("Login successful");
      _printSavedEmail();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('isLogin', 'true');
      await prefs.setString('email', _emailController.text);
      await prefs.setString('isLogin', 'true');
      Navigator.push(
        context,
        SlidePageRoute(page: NewNavbar()),
      );
    } else {
      // Login failed
      print("Login failed");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              const Text('Your credentials may be wrong. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // _isEmailVerified();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    double calculatedSemiCircleWidth = MediaQuery.of(context).size.width * 0.08;
    double imageSize = MediaQuery.of(context).size.width * 0.6;
    double imageHeight = MediaQuery.of(context).size.height * 0.157;

    // List of image paths
    final List<String> imagePaths = [
      'images/Hiremi_new_Icon.png',
      'images/LogInImage.png',
    ];

    // Generate list of image widgets
    List<Widget> imageWidgets = List.generate(imagePaths.length, (index) {
      return Center(
        child: Image.asset(
          imagePaths[index],
          width: imageSize,
          height: imageHeight,
        ),
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // List of images generated using List.generate
                ...imageWidgets,

                SizedBox(height: MediaQuery.of(context).size.height * 0.036),

                // RichText above the reusable CurvedContainer
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Let's Sign into Hiremi",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.036),

                // Reusable CurvedContainer
                CurvedContainer(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0185),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      //   child: RichText(
                      //     text: TextSpan(
                      //       children: [
                      //         TextSpan(
                      //           text: "Email Address",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         TextSpan(
                      //           text: " *",
                      //           style: TextStyle(color: Colors.red,), // Red asterisk
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //  SizedBox(height: MediaQuery.of(context).size.height * 0.0215),

                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      //   child: CurvedTextField(
                      //     controller: _emailController,
                      //     hintText: "youremail@gmail.com",
                      //     prefixIcon: Icons.account_circle,
                      //     obscureText: false,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //        return 'Please enter your email';
                      //        // print("Please enter your email");
                      //       }
                      //       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      //         return 'Please enter a valid email address';
                      //       }
                      //       return null;
                      //     },
                      //   ),
                      // ),
                      buildLabeledTextField(
                        context,
                        "Email Address",
                        "yourEmail@gmail.com",
                        controller: _emailController,
                        prefixIcon: Icons.account_circle_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0185,
                      ),

                      // SizedBox(height: MediaQuery.of(context).size.height * 0.0075),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      //   child: RichText(
                      //     text: TextSpan(
                      //       children: [
                      //         TextSpan(
                      //           text: "Password",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         TextSpan(
                      //           text: " *",
                      //           style: TextStyle(color: Colors.red), // Red asterisk
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      //   child: CurvedTextField(
                      //     controller: _passwordController,
                      //     hintText: "********",
                      //     prefixIcon: Icons.lock,
                      //     obscureText: true,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return 'Please enter your password';
                      //       }
                      //       if (value.length < 6) {
                      //         return 'Password must be at least 6 characters long';
                      //       }
                      //       return null;
                      //     },
                      //   ),
                      // ),
                      // buildLabeledTextField(
                      //   context,
                      //   "Password",
                      //   "Enter Your Password",
                      //   obscureText: true,
                      //   controller: _passwordController,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your password';
                      //     }
                      //     if (value.length < 8) {
                      //       return 'Password must be at least 8 characters long';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // buildLabeledTextField(
                      //   context,
                      //   "Password",
                      //   "Enter Your Password",
                      //   obscureText: _isObscure,
                      //   prefixIcon: Icons.lock_outline,
                      //   controller: _passwordController,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your password';
                      //     }
                      //     if (value.length < 8) {
                      //       return 'Password must be at least 8 characters long';
                      //     }
                      //     return null;
                      //   },
                      //   suffixIcon: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         _isObscure = !_isObscure; // Toggle password visibility
                      //       });
                      //     },
                      //     child: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      //   ),
                      //
                      // ),
                      buildLabeledTextField(
                        context,
                        "Password",
                        "Enter Your Password",
                        obscureText: _isObscure,
                        prefixIcon: Icons.lock_outline,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscure =
                                  !_isObscure; // Toggle password visibility
                            });
                          },
                          child: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        // Set to true to show the box with the prefix icon
                      ),

                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.00085),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.56),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors
                                .blue, // Change this to the color you want
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                  page: const Forget_Your_Password()),
                            );
                          },
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Colors
                                    .blueAccent), // Adjust text color as needed
                          ),
                        ),
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Center(
                        child: CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Login',
                          onPressed: _login,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Center(
                          child: RichText(
                              text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black, // Default text color
                        ),
                        children: [
                          const TextSpan(
                            text: "By logging in, you agree to Hiremi’s ",
                          ),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: const TextStyle(
                              color: Colors.blue, // Link color
                              decoration: TextDecoration
                                  .underline, // Optional: underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle link tap
                                
                              },
                          ),
                          const TextSpan(
                            text: ".",
                          ),
                        ],
                      ))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0205),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: const Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.018),
                      Center(
                        child: CustomElevatedButton(
                          color: const Color(0xFFF5F4F4),
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Register Now',
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(page: const Registers()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.018),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
    BuildContext context,
    String label,
    String hintText, {
    bool showPositionedBox = false,
    IconData? positionedIcon,
    IconData? prefixIcon,
    bool obscureText = false,
    List<String>? dropdownItems,
    TextEditingController? controller,
    String? Function(String?)? validator,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    bool showContainer = false,
  }) {
    double calculatedBorderRadius = MediaQuery.of(context).size.width * 0.02;
    double calculatedSemiCircleWidth = MediaQuery.of(context).size.width * 0.08;
    double calculatedPaddingStart = MediaQuery.of(context).size.width * 0.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: showContainer
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.redAccent),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      if (showPositionedBox)
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: calculatedSemiCircleWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(calculatedBorderRadius),
                                bottomLeft:
                                    Radius.circular(calculatedBorderRadius),
                              ),
                              border: const Border(
                                right: BorderSide(
                                  color: Color(0xFF808080),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: positionedIcon != null
                                  ? Icon(
                                      positionedIcon,
                                      color: Colors.grey[400],
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      Expanded(
                        child: dropdownItems != null
                            ? DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintText: hintText,
                                  border: InputBorder.none,
                                  prefixIcon: prefixIcon != null
                                      ? Icon(prefixIcon)
                                      : null,
                                ),
                                value: controller?.text.isNotEmpty == true
                                    ? controller?.text
                                    : null,
                                hint: Text(hintText),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller?.text = newValue!;
                                  });
                                },
                                items: dropdownItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                validator: validator,
                              )
                            : TextFormField(
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: hintText,
                                  border: InputBorder.none,
                                  prefixIcon: prefixIcon != null
                                      ? Icon(prefixIcon)
                                      : null,
                                  suffixIcon: suffixIcon,
                                ),
                                obscureText: obscureText,
                                validator: validator,
                                onTap: onTap,
                                keyboardType: keyboardType,
                              ),
                      ),
                      if (suffixIcon != null) suffixIcon,
                    ],
                  ),
                )
              : dropdownItems != null
                  ? DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: hintText,
                        prefixIcon:
                            prefixIcon != null ? Icon(prefixIcon) : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      value: controller?.text.isNotEmpty == true
                          ? controller?.text
                          : null,
                      hint: Text(hintText),
                      onChanged: (String? newValue) {
                        setState(() {
                          controller?.text = newValue!;
                        });
                      },
                      items: dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      validator: validator,
                    )
                  : TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        prefixIcon:
                            prefixIcon != null ? Icon(prefixIcon) : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: suffixIcon,
                      ),
                      obscureText: obscureText,
                      validator: validator,
                      onTap: onTap,
                      keyboardType: keyboardType,
                    ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0),
      ],
    );
  }
}
