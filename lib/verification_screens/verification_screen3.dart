// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/verified_page.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class VerificationScreen3 extends StatefulWidget {
//   const VerificationScreen3({Key? key}) : super(key: key);
//
//   @override
//   State<VerificationScreen3> createState() => _VerificationScreen3State();
// }
//
// class _VerificationScreen3State extends State<VerificationScreen3> {
// final _formKey = GlobalKey<FormState>();
//
//
//   final TextEditingController _IntrestedDomainController = TextEditingController();
//   final TextEditingController _fatherNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _birthPlaceController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _whatsappController = TextEditingController();
//   final TextEditingController _collegeNameController = TextEditingController();
//   final TextEditingController _collegeStateController = TextEditingController();
//   final TextEditingController _branchController = TextEditingController();
//   final TextEditingController _degreeController = TextEditingController();
//   final TextEditingController _passingYearController = TextEditingController();
//   final TextEditingController _EnrollementNumberController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers to free up resources
//
//     _fatherNameController.dispose();
//     _emailController.dispose();
//     _dobController.dispose();
//     _birthPlaceController.dispose();
//     _phoneController.dispose();
//     _whatsappController.dispose();
//     _collegeNameController.dispose();
//     _branchController.dispose();
//     _degreeController.dispose();
//     _passingYearController.dispose();
//
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   bool _isAllFieldsValid() {
//     return _formKey.currentState?.validate() ?? false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Review & Verify Your Profile',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircularPercentIndicator(
//                     radius: screenHeight * 0.05,
//                     lineWidth: 6,
//                     percent: 0.95,
//                     center: const Text(
//                       '95%',
//                       style: TextStyle(
//                           color: Colors.green, fontWeight: FontWeight.bold),
//                     ),
//                     progressColor: Colors.green,
//                     backgroundColor: Colors.grey.shade300,
//                   ),
//                   SizedBox(height: screenHeight * 0.0075),
//                   const Text(
//                     'Harsh Pawar',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: screenHeight * 0.0075),
//                   Container(
//                     // height: screenHeight * 0.03,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.1),
//                       border: Border.all(color: const Color(0xFFC1272D)),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(screenWidth * 0.01),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             color: const Color(0xFFC1272D),
//                             size: screenWidth * 0.02,
//                           ),
//                           Text(
//                             ' Not verified',
//                             style: TextStyle(
//                               color: const Color(0xFFC1272D),
//                               fontSize: screenWidth *
//                                   0.02, // Adjusted based on screen width
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
//             Container(
//               height: 1,
//               width: screenWidth * 0.9,
//               color: Colors.grey,
//             ),
//
//             // backgroundColor: Colors.white,
//             // borderColor: Colors.black,
//             // borderWidth: 0.53,
//             Form(
//               key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: screenHeight * 0.02),
//                       Padding(
//                         padding: EdgeInsets.all(screenWidth*0.04),
//                         child: const Text(
//                           'Contact Information',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       buildLabeledTextField(
//                         context,
//                         "Enrollment Number / Roll Number / College ID / UAN Number etc.",
//                         "0105IT171125",
//
//                         controller: _EnrollementNumberController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your enrollment number';
//                           }
//                           if (value.length < 10) {
//                             return 'Please enter a valid number';
//                           }
//                           return null;
//                         },
//                       ),
//                       buildLabeledTextField(
//                         context,
//                         "Interest Domain*",
//                         "Domain",
//                         keyboardType: TextInputType.text,
//                         controller: _IntrestedDomainController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Domain';
//                           }
//
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                       Row(
//                         children: [
//                           const Spacer(),
//                           Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: const Color(0xFFC1272D),
//                               ),
//                               child: TextButton(
//                                 onPressed: () {
//                                   if (_isAllFieldsValid()) {
//                                     Navigator.of(context).push(MaterialPageRoute(
//                                         builder: (ctx) => const VerifiedPage()));
//                                   } else {
//                                     setState(() {});
//                                   }
//                                 },
//                                 child: Text(
//                                   'Review & Next >',
//                                   style: TextStyle(
//                                       fontSize: screenHeight * 0.015,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                       const SizedBox(height: 70),
//                     ],
//                   ),
//                 ),
//               ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSectionHeader(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           vertical: MediaQuery.of(context).size.height * 0.02),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Widget buildLabeledTextField(
//     BuildContext context,
//     String label,
//     String hintText, {
//     bool showPositionedBox = false,
//     IconData? prefixIcon,
//     bool obscureText = false,
//     List<String>? dropdownItems,
//     TextEditingController? controller,
//     String? Function(String?)? validator,
//     VoidCallback? onTap,
//     TextInputType? keyboardType,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.04),
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: label,
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const TextSpan(
//                   text: " *",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.04),
//           child: dropdownItems != null
//               ? DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   value: controller?.text.isNotEmpty == true
//                       ? controller?.text
//                       : null,
//                   hint: Text(hintText),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       controller?.text = newValue!;
//                     });
//                   },
//                   items: dropdownItems.map((String item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }).toList(),
//                   validator: validator,
//                   isExpanded: true,
//                 )
//               : TextFormField(
//                   controller: controller,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   obscureText: obscureText,
//                   validator: validator,
//                   onTap: onTap,
//                   keyboardType: keyboardType,
//                 ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//       ],
//     );
//   }
//
//
//   Widget buildStateDropdown() {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: MediaQuery.of(context).size.width * 0.045,
//         vertical: MediaQuery.of(context).size.height * 0.01,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verified_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen3 extends StatefulWidget {
  const VerificationScreen3({Key? key}) : super(key: key);

  @override
  State<VerificationScreen3> createState() => _VerificationScreen3State();
}

class _VerificationScreen3State extends State<VerificationScreen3> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _IntrestedDomainController = TextEditingController();
  final TextEditingController _EnrollementNumberController = TextEditingController();

  @override
  void dispose() {
    _IntrestedDomainController.dispose();
    _EnrollementNumberController.dispose();
    super.dispose();
  }

  bool _isAllFieldsValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  Future<void> _saveFormDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('enrollmentNumber', _EnrollementNumberController.text);
    await prefs.setString('interestedDomain', _IntrestedDomainController.text);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review & Verify Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: screenHeight * 0.05,
                    lineWidth: 6,
                    percent: 0.95,
                    center: const Text(
                      '95%',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    progressColor: Colors.green,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: screenHeight * 0.0075),
                  const Text(
                    'Harsh Pawar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.0075),
                  Container(
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
                              fontSize: screenWidth * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
            Container(
              height: 1,
              width: screenWidth * 0.9,
              color: Colors.grey,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: const Text(
                        'Last Step Verification',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    buildLabeledTextField(
                      context,
                      "Enrollment Number / Roll Number / College ID / UAN Number etc.",
                      "0105IT171125",
                      controller: _EnrollementNumberController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your enrollment number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Interest Domain*",
                      "Domain",
                      keyboardType: TextInputType.text,
                      controller: _IntrestedDomainController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Domain';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFC1272D),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_isAllFieldsValid()) {
                                _saveFormDetails();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const VerifiedPage()));
                              } else {
                                setState(() {});
                              }
                            },
                            child: Text(
                              'Review & Next >',
                              style: TextStyle(
                                  fontSize: screenHeight * 0.015,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        bool showPositionedBox = false,
        IconData? prefixIcon,
        bool obscureText = false,
        List<String>? dropdownItems,
        TextEditingController? controller,
        String? Function(String?)? validator,
        VoidCallback? onTap,
        TextInputType? keyboardType,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: dropdownItems != null
              ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
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
            isExpanded: true,
          )
              : TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            obscureText: obscureText,
            validator: validator,
            onTap: onTap,
            keyboardType: keyboardType,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
      ],
    );
  }
}
