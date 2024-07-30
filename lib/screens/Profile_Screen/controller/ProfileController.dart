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
    await fetchExperiences();
    await fetchProjects();
    await fetchPersonalDetails();
    await fetchPersonalLinks();
    await fetchLanguages();
  }

  Future<void> fetchBasicDetails() async {
    final details = await api.getBasicDetails(profileId.toString());
    if (details['status'] != 'NA') {
      lookingFor.value = details['looking_for'] ?? '';
      email.value = details['email'] ?? '';
      print(email.value);
      city.value = details['city'] ?? '';
      phoneNumber.value = details['phone_number'] ?? '';
      state.value = details['state'] ?? '';
      whatsappNumber.value = details['whatsapp_number'] ?? '';
    }
  }

  Future<void> fetchPersonalLinks() async {
    try {
      final api = '$baseUrl/links/';
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<dynamic> filteredData =
        data.where((item) => item['profile'] == profileId.value).toList();
        personalLinks.value = filteredData
            .map((ex) => {
              'linkedin_url': ex['linkedin_url'].toString() ?? '',
              'github_url': ex['github_url'].toString() ?? '',
        })
            .toList();
      } else {
        throw Exception('Failed to load links');
      }
    } catch (e) {
      print('failed to fetch links data');
    }
  }
  Future<void> fetchExperiences() async {
    try {
      final api = '$baseUrl/experiences/';
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<dynamic> filteredData =
            data.where((item) => item['profile'] == profileId.value).toList();
        print('filter data: $filteredData');
        experience.value = filteredData
            .map((ex) => {
                  'work_experience': ex['work_experience'].toString(),
                  'work_environment': ex['work_environment'].toString(),
                  'company_name': ex['company_name'].toString(),
                  'job_title': ex['job_title'].toString(),
                  'skill_used': ex['skill_used'].toString(),
                  'start_date': ex['start_date'].toString(),
                  'current_company': ex['current_company'].toString(),
                  'end_date': ex['end_date'].toString(),
                })
            .toList();
        print('Mapped Data: $experience');
      } else {
        throw Exception('Failed to load education');
      }
    } catch (e) {
      print('failed to fetch experience data');
    }
  }

  Future<void> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/projects'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<dynamic> filteredData =
            data.where((data) => data['profile'] == profileId.value).toList();
        projects.value = filteredData
            .map((pro) => {
                  'project_title': pro['project_title'].toString(),
                  'client': pro['client'].toString(),
                  'link': pro['link'].toString(),
                  'start_date': pro['start_date'].toString(),
                  'status': pro['status'].toString(),
                  'end_date': pro['end_date'].toString(),
                  'description': pro['description'].toString(),
                })
            .toList();
      } else {
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      print('Error: $e'); // Debug: Print the error message
    }
  }

  Future<void> fetchPersonalDetails() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/personal-details'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);
        List<dynamic> filteredData =
            data.where((data) => data['profile'] == profileId.value).toList();
        if (filteredData.isNotEmpty) {
          final personalDetails = filteredData.first;
          selectedGender.value = personalDetails['gender'].toString();
          selectedMaritalStatus.value =
              personalDetails['marital_status'].toString();
          homeTown.value = personalDetails['home_town'].toString();
          pinCode.value = personalDetails['pincode'].toString();
          localAddress.value = personalDetails['local_address'].toString();
          permanentAddress.value =
              personalDetails['permanent_address'].toString();
          dob.value = personalDetails['date_of_birth'].toString();
          differentlyAbled.value = personalDetails['ability'].toString();
          category.value = personalDetails['category'].toString();
        }
      } else {
        throw Exception('Failed to load personalDetails');
      }
    } catch (e) {
      print('Error: $e'); // Debug: Print the error message
    }
  }

  Future<void> fetchEducation() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/education'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('API Response: $data'); // Debug: Print the entire API response

        List<dynamic> filteredData =
            data.where((item) => item['profile'] == profileId.value).toList();
        print('Filtered Data: $filteredData'); // Debug: Print the filtered data

        educationDetails.value = filteredData
            .map((item) => {
                  'education': item['education'].toString(),
                  'course': item['degree'].toString(),
                  'marks': item['marks'].toString(),
                  'passing_year': item['passing_year'].toString(),
                })
            .toList();
        print('Mapped Data: $educationDetails'); // Debug: Print the mapped data
      } else {
        throw Exception('Failed to load education');
      }
    } catch (e) {
      print('Error: $e'); // Debug: Print the error message
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
      resumeLink.text = details['url'] ?? '';
    }
  }

  Future<void> fetchKeySkills() async {
    final skillsData = await api.getKeySkills(profileId.toString());
    skills.value = skillsData.map((item) => item['skill'].toString()).toList();
  }
  Future<void> fetchLanguages() async {
    final languageData = await api.getLanguages(profileId.toString());
    languages.value = languageData.map((item) => item['language'].toString()).toList();
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
  final resumeLink = TextEditingController();

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
        Loaders.successSnakBar(title: 'Congratulations',message: 'Your Basic Details Has been Updated');
        fetchBasicDetails();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      Loaders.errorSnackBar(title: 'Oops',message: 'Something went Wrong');
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
        print(response.body);
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
  Future<bool> addLanguages(String language) async {
    try {
      const api = 'http://13.127.81.177:8000/api/languages/';
      final details = {
        'language': language,
        "profile": profileId.toString(),
      };

      final response = await http.post(
        Uri.parse(api),
        body: details,
      );
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Language Added Successfully');
        await fetchLanguages();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Loaders.successSnakBar(
          title: 'Oops!', message: 'Failed to Add Language.');
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

  Future<bool> addExperience(
    String experience,
    String environment,
    String companyName,
    String jobTitle,
    String skillUsed,
    String startDate,
    String isCurrentCompany,
    String endDate,
  ) async {
    try {
      final details = {
        'work_experience': experience,
        'work_environment': environment,
        'company_name': companyName,
        'job_title': jobTitle,
        'skill_used': skillUsed,
        'start_date': startDate,
        'current_company': isCurrentCompany,
        'end_date': endDate,
        'profile': profileId.toString()
      };
      final response =
          await http.post(Uri.parse('$baseUrl/experiences/'), body: details);
      print('api calls');
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Experience Data Added Successfully');
        await fetchExperiences();
        return true;
      } else {
        Loaders.warningSnackBar(title: 'Oops!', message: 'Failed to call Api');
        print('API failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oops!', message: 'Failed to Add Experience Data');
      print(e.toString());
      return false;
    }
  }

  Future<bool> addPersonalDetails(Map<String, String> details) async {
    try {
      final api = '$baseUrl/personal-details/';
      final response = await http.post(Uri.parse(api), body: details);
      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations',
            message: 'Personal Details Added Successfully');
        return true;
      } else {
        print(response.statusCode);
        print(response.body);
        Loaders.warningSnackBar(title: 'Oops!', message: 'Error Api Calls');
        await fetchPersonalDetails();
        return false;
      }
    } catch (e) {
      Loaders.warningSnackBar(title: 'Oops!', message: 'Failed to Add data');
      print(e.toString());
      return false;
    }
  }

  Future<bool> addProjects(Map<String, String> details) async {
    try {
      final api = '$baseUrl/projects/';
      final response = await http.post(Uri.parse(api), body: details);

      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations', message: 'Project Added Successfully');
        await fetchProjects();
        return true;
      } else {
        Loaders.warningSnackBar(title: 'Oops!', message: response.body);
        print('API failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oops!', message: 'Failed to Add Experience Data');
      print(e.toString());
      return false;
    }
  }



  Future<bool> addPersonalLinks(Map<String, String> details) async {
    try {
      final api = '$baseUrl/links/';
      final response = await http.post(Uri.parse(api), body: details);

      if (response.statusCode == 201) {
        Loaders.successSnakBar(
            title: 'Congratulations', message: 'Link Added Successfully');
        await fetchPersonalLinks();
        return true;
      } else {
        Loaders.warningSnackBar(title: 'Oops!', message: response.body);
        print('API failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oops!', message: 'Failed to Add Experience Data');
      print(e.toString());
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
