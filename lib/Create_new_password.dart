// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
// import 'package:hiremi_version_two/Login.dart';
//
// class CreateNewPassword extends StatefulWidget {
//   const CreateNewPassword({Key? key}) : super(key: key);
//
//   @override
//   State<CreateNewPassword> createState() => _CreateNewPasswordState();
// }
//
// class _CreateNewPasswordState extends State<CreateNewPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             'images/Hiremi_new_Icon.png',
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: MediaQuery.of(context).size.height * 0.25,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(0.0),
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Create new Password.\n",
//                                   style: TextStyle(
//                                     fontSize: 21.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black, // Default text color
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: " Make it stronger",
//                                   style: TextStyle(
//                                     fontSize: 21.0,
//                                     // color: Color(0xFF34AD78), // Uncomment if you want to set a different color
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black, // Default text color
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             textAlign: TextAlign.center, // Center align the text
//                           ),
//                         ),
//
//
//                         Center(
//                           child: Image.asset(
//                             'images/ResetPassword.png',
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: MediaQuery.of(context).size.height * 0.35,
//                           ),
//                         ),
//                         CurvedContainer(
//                           backgroundColor: Colors.white,
//                           borderColor: Colors.black,
//                           borderWidth: 0.53,
//                           child: Column(
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
//
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                               Padding(
//                                 padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.611),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                           text: "Password",
//                                           style: TextStyle(
//                                               color: Colors.black
//                                           )
//                                       ),
//                                       TextSpan(
//                                         text: " *",
//                                         style: TextStyle(color: Colors.red), // Red asterisk
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                                 child: CurvedTextField(
//                                   hintText: "********",
//                                   prefixIcon: Icons.lock,
//                                   obscureText: true,
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                               Padding(
//                                 padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.411),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                           text: "Confirm new Password",
//                                           style: TextStyle(
//                                               color: Colors.black
//                                           )
//                                       ),
//                                       TextSpan(
//                                         text: " *",
//                                         style: TextStyle(color: Colors.red), // Red asterisk
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                                 child: CurvedTextField(
//                                   hintText: "********",
//                                   prefixIcon: Icons.lock,
//                                   obscureText: true,
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0247),
//                               RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: "Password must be ",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     TextSpan(
//                                       text: "8 digit",
//                                       style: TextStyle(color: Colors.blue), // Change text color to blue
//                                     ),
//                                     TextSpan(
//                                       text: " long with combination of\nalphanumeric value",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//
//
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
//                               Center(
//                                 child: CustomElevatedButton(
//                                   width: MediaQuery.of(context).size.width * 0.775,
//                                   height: MediaQuery.of(context).size.height * 0.0625,
//                                   text: 'Reset Password',
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       SlidePageRoute(page: LogIn()),
//                                     );
//                                   },
//                                 ),
//                               ),
//
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0447),
//                             ],
//                           ),
//                         ),
//                       ],
//             ),
//           ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
// import 'package:hiremi_version_two/Login.dart';
//
// class CreateNewPassword extends StatefulWidget {
//   const CreateNewPassword({Key? key}) : super(key: key);
//
//   @override
//   State<CreateNewPassword> createState() => _CreateNewPasswordState();
// }
//
// class _CreateNewPasswordState extends State<CreateNewPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             'images/Hiremi_new_Icon.png',
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: MediaQuery.of(context).size.height * 0.25,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(0.0),
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Create new Password.\n",
//                                   style: TextStyle(
//                                     fontSize: 21.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black, // Default text color
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: " Make it stronger",
//                                   style: TextStyle(
//                                     fontSize: 21.0,
//                                     // color: Color(0xFF34AD78), // Uncomment if you want to set a different color
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black, // Default text color
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             textAlign: TextAlign.center, // Center align the text
//                           ),
//                         ),
//
//
//                         Center(
//                           child: Image.asset(
//                             'images/ResetPassword.png',
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: MediaQuery.of(context).size.height * 0.35,
//                           ),
//                         ),
//                         CurvedContainer(
//                           backgroundColor: Colors.white,
//                           borderColor: Colors.black,
//                           borderWidth: 0.53,
//                           child: Column(
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
//
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                               Padding(
//                                 padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.611),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                           text: "Password",
//                                           style: TextStyle(
//                                               color: Colors.black
//                                           )
//                                       ),
//                                       TextSpan(
//                                         text: " *",
//                                         style: TextStyle(color: Colors.red), // Red asterisk
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                                 child: CurvedTextField(
//                                   hintText: "********",
//                                   prefixIcon: Icons.lock,
//                                   obscureText: true,
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                               Padding(
//                                 padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.411),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                           text: "Confirm new Password",
//                                           style: TextStyle(
//                                               color: Colors.black
//                                           )
//                                       ),
//                                       TextSpan(
//                                         text: " *",
//                                         style: TextStyle(color: Colors.red), // Red asterisk
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                                 child: CurvedTextField(
//                                   hintText: "********",
//                                   prefixIcon: Icons.lock,
//                                   obscureText: true,
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0247),
//                               RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: "Password must be ",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     TextSpan(
//                                       text: "8 digit",
//                                       style: TextStyle(color: Colors.blue), // Change text color to blue
//                                     ),
//                                     TextSpan(
//                                       text: " long with combination of\nalphanumeric value",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//
//
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
//                               Center(
//                                 child: CustomElevatedButton(
//                                   width: MediaQuery.of(context).size.width * 0.775,
//                                   height: MediaQuery.of(context).size.height * 0.0625,
//                                   text: 'Reset Password',
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       SlidePageRoute(page: LogIn()),
//                                     );
//                                   },
//                                 ),
//                               ),
//
//                               SizedBox(height: MediaQuery.of(context).size.height * 0.0447),
//                             ],
//                           ),
//                         ),
//                       ],
//             ),
//           ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/api_services/base_services.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
import 'package:hiremi_version_two/Login.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserService _userService = UserService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'images/Hiremi_new_Icon.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Create new Password",
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Default text color
                          ),
                        ),
                        
                      ],
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                Center(
                  child: Image.asset(
                    'images/ResetPassword.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                CurvedContainer(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 0.53,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: " New Password",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              TextSpan(
                                text: " *",
                                style: TextStyle(color: Colors.red, fontSize: 16), // Red asterisk
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                        child: CurvedTextField(
                          controller: _passwordController,
                          hintText: "********",
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Confirm new Password",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              TextSpan(
                                text: " *",
                                style: TextStyle(color: Colors.red, fontSize: 16), // Red asterisk
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                        child: CurvedTextField(
                          controller: _confirmPasswordController,
                          hintText: "********",
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              //return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Password must be ",
                                style: TextStyle(color: Colors.black, fontSize: 8),
                              ),
                              TextSpan(
                                text: "8 digit",
                                style: TextStyle(color: Colors.blue, fontSize: 8), // Change text color to blue
                              ),
                              TextSpan(
                                text: " long",
                                style: TextStyle(color: Colors.black, fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                      Center(
                        child: CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Reset Password',
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              // resetPassword(
                              //   _passwordController.text,
                              //   _confirmPasswordController.text,
                              // );
                              // bool isPasswordValid = await _checkPassword();
                              bool isPasswordValid =true;

                              if(isPasswordValid) {
                                Map<String, dynamic> body = {
                                  "pass1": _passwordController.text.toString(),
                                  "pass2": _confirmPasswordController.text.toString()
                                };
                                var response = await _userService.createPostApi(
                                    body, ApiUrls.passwordReset);
                                if (response.statusCode == 200) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    context,
                                    SlidePageRoute(page: const LogIn()),
                                  );
                                }
                                else {
                                  String errorMessage = response.body;
                                  // ignore: use_build_context_synchronously
                                  print(response.body);
                                  print("---------");
                                  print(response.statusCode);

                                }
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0447),
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

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
