import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesScreen extends StatefulWidget {
  const QueriesScreen({Key? key}) : super(key: key);

  @override
  State<QueriesScreen> createState() => _QueriesScreenState();
}

class _QueriesScreenState extends State<QueriesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _queryTypeController = TextEditingController();
  final _problemDescriptionController = TextEditingController();
  final _dobController = TextEditingController();
  late int ID;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _queryTypeController.dispose();
    _problemDescriptionController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveId();
  }

  Future<void> _retrieveId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? savedId = prefs.getInt('userId');
    if (savedId != null) {
      ID = savedId;
      print(ID);
      print("Retrieved id is $savedId");
    } else {
      print("No id found in SharedPreferences");
    }
  }

  Future<void> _loadSavedId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedId = prefs.getString('id');
    if (savedId != null) {
      print('Saved ID: $savedId');
    } else {
      print('No ID found in SharedPreferences.');
    }
  }

  Future<void> _submitQuery() async {
    if (_formKey.currentState?.validate() ?? false) {
      final fullName = _fullNameController.text;
      final emailAddress = _emailController.text;
      final queryType = _queryTypeController.text;
      final problemDescription = _problemDescriptionController.text;
      final dateOfBirth = _dobController.text;

      final Map<String, dynamic> requestData = {
        'name': fullName,
        'email': emailAddress,
        'issue': queryType,
        'description': problemDescription,
        'date_of_birth': dateOfBirth,
        'register': ID,
      };

      try {
        final response = await http.post(
          Uri.parse('http://13.127.81.177:8000/query/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(requestData),
        );

        if (response.statusCode == 200) {
        } else {
          print(response.statusCode);
          print(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit query.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _selectDateOfBirth() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFFC1272D),
            hintColor: const Color(0xFFC1272D),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dobController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Format as yyyy-mm-dd
      });
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Queries",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        leading: Padding(
          padding: EdgeInsets.only(
              left: Sizes.responsiveDefaultSpace(context),
              top: Sizes.responsiveSm(context),
              bottom: Sizes.responsiveSm(context)),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.bgBlue,
              ),
              child: Center(
                child: IconButton(
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(
                      Icons.notes_outlined,
                      size: 22,
                    )),
              )),
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
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.00),
                    child: Image.asset(
                      'images/At the office-pana.png',
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Full Name', // First part of the text
                          style: TextStyle(
                            color: Colors.black, // Style for the first part
                            fontSize: 12.0, // Adjusted font size
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' *', // Second part of the text
                              style: TextStyle(
                                color: Colors.red, // Style for the second part
                                fontSize: 12.0, // Adjusted font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                      child: TextFormField(
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Email Address', // First part of the text
                          style: TextStyle(
                            color: Colors.black, // Style for the first part
                            fontSize: 12.0, // Adjusted font size
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' *', // Second part of the text
                              style: TextStyle(
                                color: Colors.red, // Style for the second part
                                fontSize: 12.0, // Adjusted font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Simple email validation
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Date of Birth', // First part of the text
                          style: TextStyle(
                            color: Colors.black, // Style for the first part
                            fontSize: 12.0, // Adjusted font size
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' *', // Second part of the text
                              style: TextStyle(
                                color: Colors.red, // Style for the second part
                                fontSize: 12.0, // Adjusted font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                      child: TextFormField(
                        controller: _dobController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          hintText: 'Date of Birth (yyyy-mm-dd)',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: _selectDateOfBirth,
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Query Type', // First part of the text
                          style: TextStyle(
                            color: Colors.black, // Style for the first part
                            fontSize: 12.0, // Adjusted font size
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' *', // Second part of the text
                              style: TextStyle(
                                color: Colors.red, // Style for the second part
                                fontSize: 12.0, // Adjusted font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                      child: TextFormField(
                        controller: _queryTypeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the query type';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          hintText: 'Query Type',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Problem Description', // First part of the text
                          style: TextStyle(
                            color: Colors.black, // Style for the first part
                            fontSize: 12.0, // Adjusted font size
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' *', // Second part of the text
                              style: TextStyle(
                                color: Colors.red, // Style for the second part
                                fontSize: 12.0, // Adjusted font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                      child: TextFormField(
                        controller: _problemDescriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please describe the problem';
                          }
                          return null;
                        },
                        maxLines: 4,
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          hintText: 'Problem Description',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: _submitQuery,
                        child: const Text(
                          'Generate Query',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
