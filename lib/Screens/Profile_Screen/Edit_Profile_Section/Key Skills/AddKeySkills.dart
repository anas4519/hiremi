import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Profile_Screen.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../../../Notofication_screen.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../Education/AddEducation.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddKeySkills extends StatefulWidget {
  const AddKeySkills({
    super.key,
  });

  @override
  State<AddKeySkills> createState() => _AddKeySkillsState();
}

class _AddKeySkillsState extends State<AddKeySkills> {
  final skillController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
      body: Padding(
        padding: EdgeInsets.only(
            top: Sizes.responsiveXl(context),
            right: Sizes.responsiveDefaultSpace(context),
            bottom: kToolbarHeight,
            left: Sizes.responsiveDefaultSpace(context)),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Key Skills',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            TextFieldWithTitle(
              controller: skillController,
              title: 'Key Skills',
              hintText: 'Eg: Flutter Developer',
              suffix: GestureDetector(
                onTap: (){
                  if (formKey.currentState!.validate()) {
                    controller.addSkill(skillController.text);
                    skillController.clear();
                  }
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
              validator: (value) =>
                  SValidator.validateEmptyText('Skills', value),
            ),
            SizedBox(
              height: Sizes.responsiveXs(context),
            ),
            Obx(
              ()=> Wrap(
                spacing: 8.0,
                children: controller.skills.map((skill) {
                  return Chip(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.37, color: AppColors.primary),
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: AppColors.white,
                    deleteIconColor: AppColors.primary,
                    label: Text(skill),
                    labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                    onDeleted: () {
                      setState(() {
                        controller.removeSkill(skill);
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                      padding: EdgeInsets.symmetric(
                          vertical: Sizes.responsiveHorizontalSpace(context),
                          horizontal: Sizes.responsiveMdSm(context)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate() ||
                          controller.skills.isEmpty) {
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  ProfileScreen()));
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primary, width: 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                      padding: EdgeInsets.symmetric(
                          vertical: Sizes.responsiveSm(context),
                          horizontal: Sizes.responsiveMdSm(context)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate() ||
                          controller.skills.isEmpty) {
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddEducation()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Save & Next',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          width: Sizes.responsiveXs(context),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 11,
                          color: AppColors.primary,
                        )
                      ],
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
