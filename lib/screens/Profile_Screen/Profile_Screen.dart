import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/repository/User.dart';
import 'package:http/http.dart' as http;
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/sections/widgets_mustufa/ProfileStatusSection.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Education/AddEducation.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Languages/AddLanguages.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Personal%20Details/AddPersonalDetails.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Projects/AddProjects.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/BasicDetails.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Education.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Experience.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/KeySkills.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Languages.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/PersonalInfo.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/PersonalLinks.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/ProfileSummary.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Projects.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/ResumeSection.dart';
import 'Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
import 'Edit_Profile_Section/Experience/AddExperience.dart';
import 'Edit_Profile_Section/Key Skills/AddKeySkills.dart';
import 'Edit_Profile_Section/ProfileSummary/ProfileSummary.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  int? profileId;
  Future<void> _getProfileId() async {
    try{
      const api = 'http://13.127.81.177:8000/api/profiles/';
      final response = await http.get(Uri.parse(api));
      if(response.statusCode == 200){
        final List<dynamic> users = jsonDecode(response.body);
        for(var user in users){
          if(user['register'] == userRepository.currentUser?.userId){
            print('User is registered to Profile');
            setState(() {
              profileId = user['id'];
            });
          }
          else{
            print('user is not registered');
          }
        }
        print('Can\'t find User');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  void initState() {
    super.initState();
    _getProfileId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: Sizes.responsiveDefaultSpace(context),
              right: Sizes.responsiveDefaultSpace(context),
              top: Sizes.responsiveDefaultSpace(context),
              bottom: Sizes.responsiveXxl(context) * 2.5),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileStatusSection(
                  fullName: controller.fullName.value,
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Divider(
                  height: 0.25,
                  thickness: 0.5,
                  color: AppColors.secondaryText,
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                ResumeSection(
                  resumeLink: controller.resumeLink.value,
                  profileId: profileId,
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                BasicDetails(
                  lookingFor: controller.lookingFor.value,
                  email: controller.email.value,
                  city: controller.city.value,
                  phoneNumber: controller.phoneNumber.value,
                  state: controller.state.value,
                  whatsappNumber: controller.whatsappNumber.value,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddBasicDetails(profileId: profileId,))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                ProfileSummary(
                  summary: controller.summary.value,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddProfileSummary(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                KeySkills(
                  skills: controller.skills,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddKeySkills(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Education(
                  education: controller.educationDetails,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddEducation(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Experience(
                  experience: controller.experience,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddExperience(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Projects(
                  projects: controller.projects,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddProjects(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                PersonalInfo(
                  gender: controller.selectedGender.value,
                  cAddress: controller.localAddress.value,
                  category: controller.category.value,
                  pinCode: controller.pinCode.value,
                  differentlyAbled: controller.differentlyAbled.value,
                  dob: controller.dob.value,
                  mStatus: controller.selectedMaritalStatus.value,
                  pAddress: controller.permanentAddress.value,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddPersonalDetails(profileId: profileId))),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                 PersonalLinks(profileId: profileId),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Languages(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  AddLanguages(profileId: profileId))),
                  languages: controller.languages,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}