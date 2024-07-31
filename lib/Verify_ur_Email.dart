// // import 'package:flutter/material.dart';
// // import 'package:hiremi_version_two/Create_new_password.dart';
// // import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// // import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// // import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// // import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
// //
// // class VerifyUrEmail extends StatefulWidget {
// //   const VerifyUrEmail({Key? key}) : super(key: key);
// //
// //   @override
// //   State<VerifyUrEmail> createState() => _VerifyUrEmailState();
// // }
// //
// // class _VerifyUrEmailState extends State<VerifyUrEmail> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: SafeArea(
// //           child: Container(
// //             child: Column(
// //               children: [
// //                 Center(
// //                   child: Image.asset(
// //                     'images/Hiremi_new_Icon.png',
// //                     width: MediaQuery.of(context).size.width * 0.6,
// //                     height: MediaQuery.of(context).size.height * 0.25,
// //                   ),
// //                 ),
// //                 Text(
// //                   "Verify Your Email Address",
// //                   style: TextStyle(
// //                     fontSize: 21.0,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //                 Text(
// //                   "Hey ,have You Received",
// //                   style: TextStyle(
// //                     fontSize: 21.0,
// //                     // color:Color(0xFF34AD78),
// //                     fontWeight: FontWeight.w400,
// //                   ),
// //                 ),
// //                 Center(
// //                   child: Image.asset(
// //                     'images/EnterOTP.png',
// //                     width: MediaQuery.of(context).size.width * 0.6,
// //                     height: MediaQuery.of(context).size.height * 0.32,
// //                   ),
// //                 ),
// //                 SizedBox(height: MediaQuery.of(context).size.height * 0.0),
// //                 CurvedContainer(
// //                   backgroundColor: Colors.white,
// //                   borderColor: Colors.black,
// //                   borderWidth: 0.53,
// //                   child: Column(
// //                     children: [
// //                       SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
// //                       Padding(
// //                         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.09),
// //                         child: RichText(
// //                           text: TextSpan(
// //                             children: [
// //                               TextSpan(
// //                                 text: "Enter One Time Address",
// //                                 style: TextStyle(color: Colors.black),
// //                               ),
// //                               TextSpan(
// //                                 text: " *",
// //                                 style: TextStyle(
// //                                   color: Colors.red,
// //                                 ), // Red asterisk
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
// //                       Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
// //                         child: CurvedTextField(
// //                           hintText: "XXXXXX",
// //                           prefixIcon: Icons.account_circle,
// //                           obscureText: false,
// //                         ),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
// //                       RichText(
// //                         textAlign: TextAlign.center,
// //                         text: TextSpan(
// //                           children: [
// //                             TextSpan(
// //                               text: "Please Enter your ",
// //                               style: TextStyle(color: Colors.black),
// //                             ),
// //                             TextSpan(
// //                               text: "six digit ",
// //                               style: TextStyle(color: Colors.blue), // Change text color to blue
// //                             ),
// //                             TextSpan(
// //                               text: "that you have received in your mailbox.",
// //                               style: TextStyle(color: Colors.black),
// //                             ),
// //                             TextSpan(
// //                               text: " ",
// //                               style: TextStyle(color: Colors.black),
// //                             ),
// //                             WidgetSpan(
// //                               child: TextButton(
// //                                 onPressed: () {
// //                                   // Handle resend OTP logic here
// //                                   print("Resend OTP clicked");
// //                                 },
// //                                 child: Text(
// //                                   "Resend OTP",
// //                                   style: TextStyle(
// //                                     color: Colors.blue,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
// //                       Center(
// //                         child: CustomElevatedButton(
// //                           width: MediaQuery.of(context).size.width * 0.775,
// //                           height: MediaQuery.of(context).size.height * 0.0625,
// //                           text: 'Confirm',
// //                           onPressed: () {
// //                             Navigator.pushReplacement(
// //                               context,
// //                               SlidePageRoute(page: CreateNewPassword()),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height * 0.0747),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Apis/api.dart';
// import 'package:hiremi_version_two/api_services/user_services.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:hiremi_version_two/Create_new_password.dart';
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
//
// class VerifyUrEmail extends StatefulWidget {
//   const VerifyUrEmail({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyUrEmail> createState() => _VerifyUrEmailState();
// }
//
// class _VerifyUrEmailState extends State<VerifyUrEmail> {
//   final UserService _userService = UserService();
//   TextEditingController otpController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> validateOTP(String otp) async {
//     final url = Uri.parse('http://13.127.81.177:8000/otp-validation/');
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'otp': otp}),
//       );
//
//       setState(() {
//         isLoading = false;
//       });
//
//       if (response.statusCode == 200) {
//         // Navigate to the next screen if OTP is valid
//         Navigator.pushReplacement(
//           context,
//           SlidePageRoute(page: CreateNewPassword()),
//         );
//       } else {
//         // Handle the error if OTP is invalid
//         print(response.body);
//         print(response.statusCode);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid OTP. Please try again.')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again later.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//             child: Column(
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'images/Hiremi_new_Icon.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.25,
//                   ),
//                 ),
//                 Text(
//                   "Verify Your Email Address",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   "Hey ,have You Received",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'images/EnterOTP.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.32,
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.0),
//                 CurvedContainer(
//                   backgroundColor: Colors.white,
//                   borderColor: Colors.black,
//                   borderWidth: 0.53,
//                   child: Column(
//                     children: [
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
//                       Padding(
//                         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.09),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Enter One Time Password",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               TextSpan(
//                                 text: " *",
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                         child: CurvedTextField(
//                           controller: otpController,
//                           hintText: "XXXXXX",
//                           prefixIcon: Icons.account_circle,
//                           obscureText: false,
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//                       RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Please Enter your ",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: "six digit ",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                             TextSpan(
//                               text: "that you have received in your mailbox.",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: " ",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             WidgetSpan(
//                               child: TextButton(
//                                 onPressed: () {
//                                   print("Resend OTP clicked");
//                                 },
//                                 child: Text(
//                                   "Resend OTP",
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
//                       Center(
//                         child: isLoading
//                             ? CircularProgressIndicator()
//                             : CustomElevatedButton(
//                           width: MediaQuery.of(context).size.width * 0.775,
//                           height: MediaQuery.of(context).size.height * 0.0625,
//                           text: 'Confirm',
//                           onPressed: () async {
//                            // validateOTP(otpController.text.toString().trim());
//                             String otp = otpController.text.toString().trim();
//                             print(otp);
//                             Map<String, dynamic> body = {
//                               "otp": otp,
//                             };
//                             final responce = await _userService.createPostApi(
//
//                                 body, ApiUrls.otpValidation);
//                             if (responce.statusCode == 200) {
//                               // ignore: use_build_context_synchronously
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) => CreateUrPass (),
//                               //   ),
//                               // );
//                               print(responce.body);
//                               print(responce.statusCode);
//                             }
//                             else
//                               {
//                                 print(responce.body);
//                                 print(responce.statusCode);
//                               }
//                           },
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0747),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Apis/api.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiremi_version_two/Create_new_password.dart';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';

class VerifyUrEmail extends StatefulWidget {
  const VerifyUrEmail({Key? key}) : super(key: key);

  @override
  State<VerifyUrEmail> createState() => _VerifyUrEmailState();
}

class _VerifyUrEmailState extends State<VerifyUrEmail> {
  final UserService _userService = UserService();
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> validateOTP(String otp) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await _userService.createPostApi({"otp": otp}, ApiUrls.otpValidation);
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        // Store the OTP in shared preferences (example usage)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('otp', otp);
        print("Hdjhf");
        Navigator.pushReplacement(
          context,
          SlidePageRoute(page: const CreateNewPassword()),
        );
      } else {
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'images/Hiremi_new_Icon.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                const Text(
                  "Verify Your Email Address",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: Image.asset(
                    'images/EnterOTP.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.32,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                CurvedContainer(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 0.53,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0215),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.09),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Enter One Time Password",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: " *",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0115),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1),
                          child: CurvedTextField(
                            controller: otpController,
                            hintText: "XXXXXX",
                            prefixIcon: Icons.account_circle,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.length != 6) {
                                return 'Enter Valid OTP';
                              } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                                return 'OTP must be 6 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0185),
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.04),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Please Enter your ",
                                style: TextStyle(color: Colors.black),
                              ),
                              const TextSpan(
                                text: "six digit ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              const TextSpan(
                                text:
                                    " code that you have received in your mailbox.",
                                style: TextStyle(color: Colors.black),
                              ),
                              const TextSpan(
                                text: " ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "Resend OTP",
                                style: const TextStyle(
                                  color: Colors.blue, // Link color
                                  decoration: TextDecoration
                                      .underline, // Optional: underline
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Resend OTP clicked');
                                  },
                              ),
                              // WidgetSpan(
                              //   child: TextButton(
                              //     onPressed: () {
                              //       print("Resend OTP clicked");
                              //     },
                              //     child: const Text(
                              //       "Resend OTP",
                              //       style: TextStyle(
                              //         color: Colors.blue,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0285),
                      Center(
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : CustomElevatedButton(
                                width:
                                    MediaQuery.of(context).size.width * 0.775,
                                height:
                                    MediaQuery.of(context).size.height * 0.0625,
                                text: 'Confirm',
                                onPressed: () async {
                                  // validateOTP(otpController.text.toString().trim());
                                  _formKey.currentState!.validate();
                                  String otp =
                                      otpController.text.toString().trim();
                                  Map<String, dynamic> body = {
                                    "otp": otp,
                                  };
                                  final responce =
                                      await _userService.createPostApi(
                                          body, ApiUrls.otpValidation);

                                  if (responce.statusCode == 200) {
                                    Navigator.pushReplacement(
                                      context,
                                      SlidePageRoute(
                                          page: const CreateNewPassword()),
                                    );
                                    // ignore: use_build_context_synchronously
                                    print(responce.statusCode);
                                    print(responce.body);
                                  } else {
                                    print(responce.statusCode);
                                    print(responce.body);
                                  }
                                },
                              ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0747),
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
}
