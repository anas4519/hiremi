import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Education/AddEducation.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Languages/AddLanguages.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Personal%20Details/AddPersonalDetails.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Edit_Profile_Section/Projects/AddProjects.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/BasicDetails.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Education.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Experience.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/KeySkills.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Languages.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/PersonalInfo.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/PersonalLinks.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/ProfileStatusSection.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/ProfileSummary.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/Projects.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/sections/widgets_mustufa/ResumeSection.dart';

import '../Drawer_Child_Screens/drawer_child.dart';
import 'Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
import 'Edit_Profile_Section/Experience/AddExperience.dart';
import 'Edit_Profile_Section/Key Skills/AddKeySkills.dart';
import 'Edit_Profile_Section/ProfileSummary/ProfileSummary.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final controller = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: const Drawer(
        child: DrawerChild(),
      ),
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
                  isVerified: controller.isVerified.value,
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
                      builder: (context) => const AddBasicDetails())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                ProfileSummary(
                  summary: controller.summary.value,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddProfileSummary())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                KeySkills(
                  skills: controller.skills,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddKeySkills())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Education(
                  education: controller.educationDetails,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddEducation())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Experience(
                  experience: controller.experience,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddExperience())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Projects(
                  projects: controller.projects,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddProjects())),
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
                      builder: (context) => const AddPersonalDetails())),
                ),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                 PersonalLinks(),
                SizedBox(
                  height: Sizes.responsiveMd(context),
                ),
                Languages(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AddLanguages())),
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
