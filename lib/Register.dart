// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Apis/api.dart';
// import 'package:hiremi_version_two/Controller/Register_controller.dart';
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Login.dart';
// import 'package:hiremi_version_two/Models/register_model.dart';
// import 'package:hiremi_version_two/api_services/user_services.dart';
// import 'package:intl/intl.dart';
//
// class Registers extends StatefulWidget {
//   const Registers({Key? key}) : super(key: key);
//
//   @override
//   _RegistersState createState() => _RegistersState();
// }
//
// class _RegistersState extends State<Registers> {
//   final _formKey = GlobalKey<FormState>();
//   Gender? _selectedGender=Gender.Male;
//   String? _selectedState;
//   DateTime? _selectedDate;
//
//   // List<String> _states = ['State 1', 'State 2', 'State 3', 'State 4'];
//
//
//
// final List<String> _states = [
//   'Andhra Pradesh',
//   'Arunachal Pradesh',
//   'Assam',
//   'Bihar',
//   'Chhattisgarh',
//   'Goa',
//   'Gujarat',
//   'Haryana',
//   'Himachal Pradesh',
//   'Jharkhand',
//   'Karnataka',
//   'Kerala',
//   'Madhya Pradesh',
//   'Maharashtra',
//   'Manipur',
//   'Meghalaya',
//   'Mizoram',
//   'Nagaland',
//   'Odisha',
//   'Punjab',
//   'Rajasthan',
//   'Sikkim',
//   'Tamil Nadu',
//   'Telangana',
//   'Tripura',
//   'Uttar Pradesh',
//   'Uttarakhand',
//   'West Bengal',
//   'Andaman and Nicobar Islands',
//   'Chandigarh',
//   'Dadra and Nagar Haveli and Daman and Diu',
//   'Delhi',
//   'Jammu and Kashmir',
//   'Ladakh',
//   'Lakshadweep',
//   'Puducherry',
// ];
//
//
//   final TextEditingController _fullNameController = TextEditingController();
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
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   RegistrationController _registrationController = RegistrationController();
//
//   void _handleGenderChange(Gender? value) {
//     setState(() {
//       _selectedGender = value;
//     });
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers to free up resources
//     _fullNameController.dispose();
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
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     double imageSize = MediaQuery.of(context).size.width * 0.6;
//     double imageHeight = MediaQuery.of(context).size.height * 0.157;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Image.asset(
//                 'images/Hiremi_new_Icon.png',
//                 width: imageSize,
//                 height: imageHeight,
//               ),
//             ),
//             Center(
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: const TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Register to get started\n",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Start your journey with us ",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
//             CurvedContainer(
//               backgroundColor: Colors.white,
//               borderColor: Colors.black,
//               borderWidth: 0.53,
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.045),
//                     buildSectionHeader("Personal Information"),
//                     buildLabeledTextField(
//                       context,
//                       "Full Name",
//                       "John Doe",
//                       controller: _fullNameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Father's Full Name",
//                       "Robert Dave",
//                       controller: _fatherNameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your father\'s full name';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildGenderField(),
//                     buildLabeledTextField(
//                       context,
//                       "Email Address",
//                       "yourEmail@gmail.com",
//                       controller: _emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email address';
//                         }
//                         if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Date Of Birth",
//                       "DD/MM/YYYY",
//                       showPositionedBox: true,
//                       prefixIcon: Icons.calendar_today,
//                       controller: _dobController,
//                       validator: (value) {
//                         if (_selectedDate == null) {
//                           return 'Please select your date of birth';
//                         }
//                         return null;
//                       },
//                       onTap: () async {
//                         final DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1900),
//                           lastDate: DateTime.now(),
//                         );
//                         if (pickedDate != null) {
//                           setState(() {
//                             _selectedDate = pickedDate;
//                             _dobController.text =DateFormat('yyyy-MM-dd').format(pickedDate);
//                           });
//                         }
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Birth Place",
//                       "Select State",
//                       controller: _birthPlaceController,
//                       dropdownItems: _states,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your birth place';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildSectionHeader("Contact Information"),
//                     buildLabeledTextField(
//                       context,
//                       "Phone Number",
//                       "+91",
//                       keyboardType: TextInputType.phone,
//                       controller: _phoneController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                         if (value.length < 10) {
//                           return 'Please enter a valid phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "WhatsApp Number",
//                       "+91",
//                       keyboardType: TextInputType.phone,
//                       controller: _whatsappController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your WhatsApp number';
//                         }
//                         if (value.length < 10) {
//                           return 'Please enter a valid WhatsApp number';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildSectionHeader("Educational Information"),
//                     buildLabeledTextField(
//                       context,
//                       "College Name",
//                       "Enter Your College Name",
//                       controller: _collegeNameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your college name';
//                         }
//                         return null;
//                       },
//                     ),
//                     //buildStateDropdown(),
//                     buildLabeledTextField(
//                       context,
//                       "College's State",
//                       "Enter Your College's State",
//                       controller: _collegeStateController,
//                       dropdownItems: _states,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your College's State";
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Branch",
//                       "Enter Your Branch Name",
//                       controller: _branchController,
//                       dropdownItems: ['Degree 1', 'Degree 2', 'Degree 3'],
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your branch';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Degree",
//                       "Enter Your Degree Name",
//                       controller: _degreeController,
//                       dropdownItems: ['Degree 1', 'Degree 2', 'Degree 3'],
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your degree';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Passing Year",
//                       "Enter Your Passing Year",
//                       controller: _passingYearController,
//
//                       dropdownItems: ['2012', '2024', '2025'],
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your passing year';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildSectionHeader("Let's Create Password"),
//
//                     buildLabeledTextField(
//                       context,
//                       "Password",
//                       "Enter Your Password",
//                       obscureText: true,
//                       controller: _passwordController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         if (value.length < 8) {
//                           return 'Password must be at least 8 characters long';
//                         }
//                         return null;
//                       },
//                     ),
//                     buildLabeledTextField(
//                       context,
//                       "Confirm Password",
//                       "Enter Your Password",
//                       obscureText: true,
//                       controller: _confirmPasswordController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                     CustomElevatedButton(
//                       width: MediaQuery.of(context).size.width * 0.775,
//                       height: MediaQuery.of(context).size.height * 0.0625,
//                       text: 'Register Now',
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           User newUser = User(
//                             fullName: _fullNameController.text,
//                             fatherName: _fatherNameController.text,
//                             gender: _selectedGender ?? Gender.Other,
//                             email: _emailController.text,
//                             dob: _dobController.text,
//                             birthPlace: _birthPlaceController.text,
//                             phone: _phoneController.text,
//                             whatsapp: _whatsappController.text,
//                             collegeName: _collegeNameController.text,
//                             collegeState: _selectedState ?? _states.first,
//                             branch: _branchController.text,
//                             degree: _degreeController.text,
//                             passingYear: _passingYearController.text,
//                             password: _passwordController.text,
//                           );
//
//                           bool registrationSuccess = await _registrationController.registerUser(newUser);
//
//
//                           if (registrationSuccess) {
//                             // Registration successful, navigate to login or next screen
//                             Navigator.pushReplacement(
//                               context,
//                               SlidePageRoute(page: const LogIn()),
//                             );
//                           }
//                           else {
//                             // Show error message to user
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Registration failed. Please try again.'),
//                                 duration: Duration(seconds: 3),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.025),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSectionHeader(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
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
//
//
//   // Widget buildLabeledTextField(
//   //     BuildContext context,
//   //     String label,
//   //     String hintText, {
//   //       bool showPositionedBox = false,
//   //       IconData? prefixIcon,
//   //       bool obscureText = false,
//   //       List<String>? dropdownItems,
//   //       TextEditingController? controller,
//   //       String? Function(String?)? validator,
//   //       VoidCallback? onTap,
//   //       TextInputType? keyboardType,
//   //     }) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Padding(
//   //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//   //         child: RichText(
//   //           text: TextSpan(
//   //             children: [
//   //               TextSpan(
//   //                 text: label,
//   //                 style: TextStyle(color: Colors.black),
//   //               ),
//   //               TextSpan(
//   //                 text: " *",
//   //                 style: TextStyle(color: Colors.red),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//   //       Padding(
//   //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//   //         child: dropdownItems != null
//   //             ? DropdownButtonFormField<String>(
//   //           decoration: InputDecoration(
//   //             hintText: hintText,
//   //             prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//   //             border: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(10),
//   //             ),
//   //           ),
//   //           value: controller?.text.isNotEmpty == true ? controller?.text : null,
//   //           hint: Text(hintText),
//   //           onChanged: (String? newValue) {
//   //             setState(() {
//   //               controller?.text = newValue!;
//   //             });
//   //           },
//   //           items: dropdownItems.map((String item) {
//   //             return DropdownMenuItem<String>(
//   //               value: item,
//   //               child: Text(item),
//   //             );
//   //           }).toList(),
//   //           validator: validator,
//   //         )
//   //             : TextFormField(
//   //           controller: controller,
//   //           decoration: InputDecoration(
//   //             hintText: hintText,
//   //             prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//   //             border: OutlineInputBorder(
//   //               borderRadius: BorderRadius.circular(10),
//   //             ),
//   //           ),
//   //           obscureText: obscureText,
//   //           validator: validator,
//   //           onTap: onTap,
//   //           keyboardType: keyboardType,
//   //         ),
//   //       ),
//   //       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//   //     ],
//   //   );
//   // }
//   Widget buildLabeledTextField(
//       BuildContext context,
//       String label,
//       String hintText, {
//         bool showPositionedBox = false,
//         IconData? prefixIcon,
//         bool obscureText = false,
//         List<String>? dropdownItems,
//         TextEditingController? controller,
//         String? Function(String?)? validator,
//         VoidCallback? onTap,
//         TextInputType? keyboardType,
//       }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
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
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//           child: dropdownItems != null
//               ? DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//
//               hintText: hintText,
//               prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             value: controller?.text.isNotEmpty == true ? controller?.text : null,
//             hint: Text(hintText),
//             onChanged: (String? newValue) {
//               setState(() {
//                 controller?.text = newValue!;
//               });
//             },
//             items: dropdownItems.map((String item) {
//               return DropdownMenuItem<String>(
//
//                 value: item,
//                 child: Text(item),
//               );
//             }).toList(),
//             validator: validator,
//             isExpanded: true,
//           )
//               : TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hintText,
//               prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             obscureText: obscureText,
//             validator: validator,
//             onTap: onTap,
//             keyboardType: keyboardType,
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//       ],
//     );
//   }
//
//
//
//   Widget buildGenderField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
//           child: RichText(
//             text: const TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'Gender',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 TextSpan(
//                   text: " *",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.085),
//           child: Row(
//             children: [
//               Radio(
//                 value: Gender.Male,
//                 groupValue: _selectedGender,
//                 onChanged: _handleGenderChange,
//               ),
//               const Text('Male'),
//               Radio(
//                 value: Gender.Female,
//                 groupValue: _selectedGender,
//                 onChanged: _handleGenderChange,
//               ),
//               const Text('Female'),
//               Radio(
//                 value: Gender.Other,
//                 groupValue: _selectedGender,
//                 onChanged: _handleGenderChange,
//               ),
//               const Text('Other'),
//             ],
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//       ],
//     );
//   }
//
//
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
//
//           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Apis/api.dart';
import 'package:hiremi_version_two/Controller/Register_controller.dart';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/dropdown.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:hiremi_version_two/Models/register_model.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:intl/intl.dart';

class Registers extends StatefulWidget {
  const Registers({Key? key}) : super(key: key);

  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final _formKey = GlobalKey<FormState>();
  Gender? _selectedGender=Gender.Male;
  String? _selectedState;
  DateTime? _selectedDate;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = false;


  List<String> _states = ['State 1', 'State 2', 'State 3', 'State 4'];

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _collegeStateController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _passingYearController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegistrationController _registrationController = RegistrationController();

  void _handleGenderChange(Gender? value) {
    setState(() {
      _selectedGender = value;
    });
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _fullNameController.dispose();
    _fatherNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _birthPlaceController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _collegeNameController.dispose();
    _branchController.dispose();
    _degreeController.dispose();
    _passingYearController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");
    double imageSize = MediaQuery.of(context).size.width * 0.6;
    double imageHeight = MediaQuery.of(context).size.height * 0.157;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'images/Hiremi_new_Icon.png',
                width: imageSize,
                height: imageHeight,
              ),
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Register to get started\n",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Start your journey with us ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
            CurvedContainer(
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              borderWidth: 0.53,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                    buildSectionHeader("Personal Information"),
                    buildLabeledTextField(
                      context,
                      "Full Name",
                      "John Doe",
                      controller: _fullNameController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Father's Full Name",
                      "Robert Dave",
                      controller: _fatherNameController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your father\'s full name';
                        }
                        return null;
                      },
                    ),
                    buildGenderField(),
                    buildLabeledTextField(
                      context,
                      "Email Address",
                      "yourEmail@gmail.com",
                      controller: _emailController,
                      obscureText: false,
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
                    buildLabeledTextField(
                      context,
                      "Date Of Birth",
                      "DD/MM/YYYY",
                      showPositionedBox: true,
                      prefixIcon: Icons.calendar_today,
                      controller: _dobController,
                      obscureText: false,
                      validator: (value) {
                        if (_selectedDate == null) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _dobController.text =DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Birth Place",
                      "Select State",
                      controller: _birthPlaceController,
                      dropdownItems: DropdownData.states,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your birth place';
                        }
                        return null;
                      },
                    ),
                    buildSectionHeader("Contact Information"),
                    buildLabeledTextField(
                      context,
                      "Phone Number",
                      "+91",
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "WhatsApp Number",
                      "+91",
                      keyboardType: TextInputType.phone,
                      controller: _whatsappController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your WhatsApp number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid WhatsApp number';
                        }
                        return null;
                      },
                    ),
                    buildSectionHeader("Educational Information"),
                    buildLabeledTextField(
                      context,
                      "College Name",
                      "Enter Your College Name",
                      controller: _collegeNameController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your college name';
                        }
                        return null;
                      },
                    ),
                    //buildStateDropdown(),
                    buildLabeledTextField(
                      context,
                      "College's State",
                      "Enter Your College's State",
                      controller: _collegeStateController,
                      dropdownItems: DropdownData.states,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your College's State";
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Branch",
                      "Enter Your Branch Name",
                      controller: _branchController,
                      dropdownItems: DropdownData.branch,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your branch';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Degree",
                      "Enter Your Degree Name",
                      controller: _degreeController,
                      dropdownItems: DropdownData.degrees,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your degree';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Passing Year",
                      "Enter Your Passing Year",
                      controller: _passingYearController,
                      dropdownItems: DropdownData.passingyear,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your passing year';
                        }
                        return null;
                      },
                    ),
                    buildSectionHeader("Let's Create Password"),

                    // buildLabeledTextField(
                    //   context,
                    //   "Password",
                    //   "Enter Your Password",
                    //   obscureText: true,
                    //   controller: _passwordController,
                    //
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
                    buildLabeledTextField(
                      context,
                      "Password",
                      "Enter Your Password",
                      controller: _passwordController,
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: Icons.remove_red_eye,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      obscureText: _isPasswordObscure, // Toggle this based on state
                      onTap: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure; // Toggle password visibility
                        });
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Confirm Password",
                      "Enter Your Password",
                      controller: _confirmPasswordController,
                      prefixIcon: Icons.lock_outlined,
                      suffixIcon: Icons.remove_red_eye,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      obscureText: _isConfirmPasswordObscure, // Toggle this based on state
                      onTap: () {
                        setState(() {
                          _isConfirmPasswordObscure = !_isConfirmPasswordObscure; // Toggle password visibility
                        });
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomElevatedButton(
                      width: MediaQuery.of(context).size.width * 0.775,
                      height: MediaQuery.of(context).size.height * 0.0625,
                      text: 'Register Now',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User newUser = User(
                            fullName: _fullNameController.text,
                            fatherName: _fatherNameController.text,
                            gender: _selectedGender ?? Gender.Other,
                            email: _emailController.text,
                            dob: _dobController.text,
                            birthPlace: _birthPlaceController.text,
                            phone: _phoneController.text,
                            whatsapp: _whatsappController.text,
                            collegeName: _collegeNameController.text,
                            collegeState: _selectedState ?? _states.first,
                            branch: _branchController.text,
                            degree: _degreeController.text,
                            passingYear: _passingYearController.text,
                            password: _passwordController.text,
                          );

                          bool registrationSuccess = await _registrationController.registerUser(newUser);


                          if (registrationSuccess) {
                            // Registration successful, navigate to login or next screen
                            Navigator.pushReplacement(
                              context,
                              SlidePageRoute(page: const LogIn()),
                            );
                          }
                          else {
                            // Show error message to user
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registration failed. Please try again.'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }




  // Widget buildLabeledTextField(
  //     BuildContext context,
  //     String label,
  //     String hintText, {
  //       bool showPositionedBox = false,
  //       IconData? prefixIcon,
  //       IconData? suffixIcon,
  //       bool obscureText = true,
  //       List<String>? dropdownItems,
  //       TextEditingController? controller,
  //       String? Function(String?)? validator,
  //       VoidCallback? onTap,
  //       TextInputType? keyboardType,
  //     }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
  //         child: RichText(
  //           text: TextSpan(
  //             children: [
  //               TextSpan(
  //                 text: label,
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //               TextSpan(
  //                 text: " *",
  //                 style: TextStyle(color: Colors.red),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
  //         child: dropdownItems != null
  //             ? DropdownButtonFormField<String>(
  //           decoration: InputDecoration(
  //             hintText: hintText,
  //             prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           ),
  //           value: controller?.text.isNotEmpty == true ? controller?.text : null,
  //           hint: Text(hintText),
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               controller?.text = newValue!;
  //             });
  //           },
  //           items: dropdownItems.map((String item) {
  //             return DropdownMenuItem<String>(
  //               value: item,
  //               child: Text(item),
  //             );
  //           }).toList(),
  //           validator: validator,
  //         )
  //             : TextFormField(
  //           controller: controller,
  //           decoration: InputDecoration(
  //             hintText: hintText,
  //             prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
  //             suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
  //
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           ),
  //           obscureText: obscureText,
  //           validator: validator,
  //           onTap: onTap,
  //           keyboardType: keyboardType,
  //         ),
  //       ),
  //       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
  //     ],
  //   );
  // }

  Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        bool showPositionedBox = false,
        IconData? prefixIcon,
        IconData? suffixIcon,
        bool obscureText = true,
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
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
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
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: dropdownItems != null
              ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: controller?.text.isNotEmpty == true ? controller?.text : null,
            hint: Text(hintText),
            onChanged: (String? newValue) {
              setState(() {
                controller?.text = newValue!;
              });
            },
            items: dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: SizedBox( // Adjust the width of the dropdown item
                  width: MediaQuery.of(context).size.width * 0.5, // Example width, adjust as necessary
                  child: Text(item),
                ),
              );
            }).toList(),
            validator: validator,
          )
              : TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
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







  Widget buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Gender',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.085),
          child: Row(
            children: [
              Radio(
                value: Gender.Male,
                groupValue: _selectedGender,
                onChanged: _handleGenderChange,
              ),
              const Text('Male'),
              Radio(
                value: Gender.Female,
                groupValue: _selectedGender,
                onChanged: _handleGenderChange,
              ),
              const Text('Female'),
              Radio(
                value: Gender.Other,
                groupValue: _selectedGender,
                onChanged: _handleGenderChange,
              ),
              const Text('Other'),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
      ],
    );
  }




  Widget buildStateDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.045,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: MediaQuery.of(context).size.height * 0.01),

        ],
      ),
    );
  }
}
