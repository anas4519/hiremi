import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    toggleVerification();
  }

  /// Variables
  var isVerified = false.obs;
  final resumeLink = TextEditingController().obs;

  /// Basic Info
  var lookingFor = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var whatsappNumber = ''.obs;
  var summary = ''.obs;

  /// Personal Info
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

  // Method to Save resume Link
  void basicDetails(
    String cityValue,
    String stateValue,
    String emailValue,
    String phoneNumberValue,
    String whatsappNumberValue,
    String lookingForValue,
  ) {
    lookingFor.value = lookingForValue;
    city.value = cityValue;
    state.value = stateValue;
    email.value = emailValue;
    phoneNumber.value = phoneNumberValue;
    whatsappNumber.value = whatsappNumberValue;
  }

  void saveSummary(String value) {
    summary.value = value;
  }

// Method to add a skill
  void addSkill(String skill) {
    skills.add(skill);
  }

  void removeSkill(String skill) {
    skills.remove(skill);
  }

  // Method to add an education detail
  void addEducationDetail(Map<String, String> educationDetail) {
    educationDetails.add(educationDetail);
  }
// Method to add an personal  links
  void addPersonalLinks(String titleLink,String link){
    personalLinks.add({
      'title': titleLink,'link': link
    });
  }
// Method to add an experience detail
  void addExperienceDetail(Map<String, String> experienceDetail) {
    experience.add(experienceDetail);
  }

  void addProjectsDetail(Map<String, String> projectsDetail) {
    projects.add(projectsDetail);
  }



  void addPersonalDetails(
      String home, String pin, String lAddress, String pAddress, String dobirth, String cat) {
    homeTown.value = home;
    pinCode.value = pin;
    permanentAddress.value = pAddress;
    localAddress.value = lAddress;
    dob.value = dobirth;
    category.value = cat;
  }

  // Method to add a language
  void addLanguage(String language) {
    languages.add(language);
  }

  // Method to remove a language
  void removeLanguage(String language) {
    languages.remove(language);
  }

  // Method to toggle verification status
  void toggleVerification() {
    if (skills.isNotEmpty &&
        educationDetails.isNotEmpty &&
        languages.isNotEmpty) {
      isVerified.value = true;
    }
  }
}
