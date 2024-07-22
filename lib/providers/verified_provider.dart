import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerificationNotifier extends StateNotifier<bool> {
  VerificationNotifier() : super(false);

  Future<void> checkVerified() async {
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        String storedEmail = prefs.getString('email') ?? 'No email saved';

        for (var user in data) {
          if (user['email'] == storedEmail) {
            print(user['verified']);
            String verified = user['verified'];
            state = verified == 'true';
            break;
          }
        }
        if (!state) {
          print('No matching email found or not verified');
        }
      } else {
        print('Failed to fetch verification status');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void verify() {
    state = true;
  }

  void unverify() {
    state = false;
  }
}

final verificationProvider =
    StateNotifierProvider<VerificationNotifier, bool>((ref) {
  return VerificationNotifier();
});
