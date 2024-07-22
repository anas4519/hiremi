
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifiedPage extends ConsumerStatefulWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends ConsumerState<VerifiedPage> {
  String email = " "; // Initial value for testing

  @override
  void initState() {
    super.initState();
    _printSavedEmail();
   // _checkEmail();
    //markedVerified();
  }

  Future<void> _printSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email') ?? 'No email saved';
    setState(() {
      email = savedEmail;
    });
    print(email);
    _checkEmail();
  }

  Future<void> _checkEmail() async {
    // Example URL for fetching user data by email
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";

    try {
      final response = await http.get(Uri.parse('$apiUrl?email=$email'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Update user verification based on fetched data
        for (var user in data) {
          if (user['email'] == email) {
            await updateUserVerificationStatus(user['id']);
            break;
          }
        }

        if (data.isEmpty) {
          print('No user found for email: $email');
        }
      } else {
        print('Failed to fetch user data');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateUserVerificationStatus(int userId) async {
    // Example URL for updating user verification
    final String updateUrl = "http://13.127.81.177:8000/api/registers/$userId/";

    try {
      final response = await http.patch(
        Uri.parse(updateUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'verified': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('User verification updated successfully: $data');
      } else {
        print('Failed to update user verification');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hiremi's Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const NotificationScreen()));
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/new_releases.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                ),
                Text(
                  ' Payment Successful & Successfully Verified',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: screenWidth * 0.037,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight * 0.45,
                  child: Image.asset(
                    'images/confetti bg.png',
                    fit: BoxFit.cover,
                    width: screenWidth,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.06,
                  child: Image.asset(
                    'images/Product quality-pana.png',
                    width: screenWidth * 0.8,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/new_releases.png',
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                    ),
                    Text(
                      ' Verified users can access jobs & internships at Hiremi.',
                      style: TextStyle(fontSize: screenWidth * 0.025),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('  '), // Placeholder for space
                    Image.asset(
                      'images/new_releases.png',
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                    ),
                    Text(
                      ' Verified users also get personalized career guidance.',
                      style: TextStyle(fontSize: screenWidth * 0.025),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>NewNavbar()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xFFC1272D)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue Exploration >',
                    style: TextStyle(fontSize: screenWidth * 0.025),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}