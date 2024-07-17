import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../../../Notofication_screen.dart';
import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import '../../../../Utils/validators/validation.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../../Profile_Screen.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddLanguages extends StatefulWidget {
  const AddLanguages({
    super.key,
  });

  @override
  State<AddLanguages> createState() => _AddLanguagesState();
}

class _AddLanguagesState extends State<AddLanguages> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController languageController = TextEditingController();

  final controller = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
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
                top: Sizes.responsiveXl(context),
                right: Sizes.responsiveDefaultSpace(context),
                bottom: kToolbarHeight,
                left: Sizes.responsiveDefaultSpace(context)),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Languages',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Sizes.responsiveMd(context),
                    ),
                    TextFieldWithTitle(
                        controller: languageController,
                        title: 'Add Language',
                        validator: (value) =>
                            SValidator.validateEmptyText('Language', value),
                        suffix: GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              controller.addLanguage(languageController.text);
                              languageController.clear();
                            }
                          },
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        hintText: 'eg: Hindi, English etc.'),
                    SizedBox(
                      height: Sizes.responsiveXs(context),
                    ),
                      Obx(
                        () => Wrap(
                          spacing: 8.0,
                          children: controller.languages.map((language) {
                            return Chip(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.37, color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor: AppColors.white,
                              deleteIconColor: AppColors.primary,
                              label: Text(language),
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                              onDeleted: () {
                                controller.removeLanguage(language);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    SizedBox(
                      height: Sizes.responsiveMd(context) * 2,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.radiusSm)),
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    Sizes.responsiveHorizontalSpace(context),
                                horizontal: Sizes.responsiveMdSm(context)),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate() ||
                                controller.languages.isEmpty) {
                              return;
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ProfileScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          )),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
