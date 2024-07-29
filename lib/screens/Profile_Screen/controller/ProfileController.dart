import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/repository/User.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;

import '../../../api_services/get_all_data/Get_all_data.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final String baseUrl = 'http://13.127.81.177:8000/api';
  final api = ApiService();

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getProfileId();
    await fetchBasicDetails();
    await fetchSummary();
    await fetchKeySkills();
    await fetchResumeLink();
    await fetchEducation();
  }

  Future<void> fetchBasicDetails() async {
    final details = await api.getBasicDetails(profileId.toString());
    if (details['status'] != 'NA') {
      lookingFor.value = details['looking_for'] ?? '';
      email.value = details['email'] ?? '';
      city.value = details['city'] ?? '';
      phoneNumber.value = details['phone_number'] ?? '';
      state.value = details['state'] ?? '';
      whatsappNumber.value = details['whatsapp_number'] ?? '';
    }
  }

  Future<void> fetchEducation() async {
    final response = await http.get(Uri.parse('$baseUrl/education'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<dynamic> filteredData = data.where((item) => item['profile'] == profileId.value).toList();

      educationDetails.value = filteredData.map((item) => {
        'education': item['education'].toString(),
        'course': item['degree'].toString(),
        'marks': item['marks'].toString(),
        'passing_year': item['passing_year'].toString(),
      }).toList();
    } else {
      throw Exception('Failed to load education');
    }
  }


  Future<void> fetchSummary() async {
    final details = await api.getProfileSummary(profileId.toString());
    if (details['status'] != 'NA') {
      summary.value = details['summary'] ?? '';
    }
  }

  Future<void> fetchResumeLink() async {
    final details = await api.getResumeLink(profileId.toString());
    if (details['status'] != 'NA') {
      resumeLink.value = details['url'] ?? '';
    }
  }

  Future<void> fetchKeySkills() async {
    final skillsData = await api.getKeySkills(profileId.toString());
    skills.value = skillsData.map((item) => item['skill'].toString()).toList();
  }

  Future<void> _getProfileId() async {
    try {
      const api = 'http://13.127.81.177:8000/api/profiles/';
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        for (var user in users) {
          if (user['register'] == userRepository.currentUser?.userId) {
            print('User is registered to Profile');
            profileId.value = user['id'];
          } else {
            print('user is not registered');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /// Variables
  final user = userRepository.currentUser;
  final resumeLinkController = TextEditingController();
  final resumeLink = ''.obs;

  /// Global Used everywhere
  var profileId = Rxn<int>();

  /// Basic Info
  var lookingFor = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var whatsappNumber = ''.obs;
  var summary = ''.obs;

  /// Personal Info
  var fullName = ''.obs;
  var selectedGender = ''.obs;
  var selectedMaritalStatus = ''.obs;
  var differentlyAbled = ''.obs;
  var homeTown = ''.obs;
  var pinCode = ''.obs;
  var localAddress = ''.obs;
  var permanentAddress = ''.obs;
  var dob = ''.obs;
  var category = ''.obs;

  var skills = <String>[].obs;
  var personalLinks = <Map<String, String>>[].obs;
  var experience = <Map<String, String>>[].obs;
  var projects = <Map<String, String>>[].obs;
  var educationDetails = <Map<String, String>>[].obs;

  var languages = <String>[].obs;

  Future<bool> addBasicDetails(Map<String, String> details) async {
    try {
      const api = 'http://13.127.81.177:8000/api/basic-details/';
      final response = await http.post(
        Uri.parse(api),
        body: details,
      );
      if (response.statusCode == 201) {
        Get.snackbar('Congratulations', 'Your Basic Details Has been Updated.',
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(25));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Oops', 'Something went Wrong.',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(25));
      return false;
    }
  }

  Future<bool> addSummary(String summary) async {
    try {
      const api = 'http://13.127.81.177:8000/api/profile-summaries/';
      final details = {
        'summary': summary,
        'profile': profileId.toString(),
      };
      final response = await http.post(
        Uri.parse(api),
        body: details,
      );
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Your Details Has been Updated Successfully');
        await fetchSummary();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oops', message: 'Something went Wrong');
      return false;
    }
  }

  Future<bool> addResumeLink(String resumeLink) async {
    try {
      print('APi Calling');
      const api = 'http://13.127.81.177:8000/api/resumelink/';
      final details = {
        'url': resumeLink,
        'profile': profileId.toString(),
      };
      final response = await http.post(
        Uri.parse(api),
        body: details,
      );
      if (response.statusCode == 201) {
        print('APi success');
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Resume Link Updated Successfully.');
        await fetchResumeLink();
        return true;
      } else {
        Loaders.successSnakBar(
            title: 'Sorry!', message: 'Please Provide Valid Link for Resume.');
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oops', message: 'Failed to Update Resume link.');
      return false;
    }
  }

  Future<bool> addKeySkills(String skill) async {
    try {
      const api = 'http://13.127.81.177:8000/api/key-skills/';
      final details = {
        'skill': skill,
        "profile": profileId.toString(),
      };

      final response = await http.post(
        Uri.parse(api),
        body: details,
      );
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Your Details Has been Updated Successfully');
        await fetchKeySkills();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Loaders.successSnakBar(
          title: 'Oops!', message: 'Failed to Add Key skills.');
      return false;
    }
  }

  Future<bool> addExperiences(
    String education,
    String course,
    String marks,
    String passingYear,
  ) async {
    try {
      const url = 'http://13.127.81.177:8000/api/experiences/';
      final details = {
        "education": education,
        "degree": course,
        "passing_year": passingYear,
        "marks": marks,
        "profile": profileId.toString(),
      };
      final response = await http.post(Uri.parse(url), body: details);
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Your Education Details Added Successfully');
        return true;
      } else {
        print(
            'Failed to add education details. Status code: ${response.statusCode}');
        Loaders.errorSnackBar(
            title: 'Oops', message: 'Failed to add education details.');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding education details: $e');
      return false;
    }
  }

  Future<bool> addEducation(
    String education,
    String course,
    String marks,
    String passingYear,
  ) async {
    try {
      const url = 'http://13.127.81.177:8000/api/education/';
      final details = {
        "education": education,
        "degree": course,
        "passing_year": passingYear,
        "marks": marks,
        "profile": profileId.toString(),
      };
      final response = await http.post(Uri.parse(url), body: details);
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Your Education Details Added Successfully');
        await fetchEducation();
        return true;
      } else {
        print(
            'Failed to add education details. Status code: ${response.statusCode}');
        Loaders.errorSnackBar(
            title: 'Oops', message: 'Failed to add education details.');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding education details: $e');
      return false;
    }
  }
}
