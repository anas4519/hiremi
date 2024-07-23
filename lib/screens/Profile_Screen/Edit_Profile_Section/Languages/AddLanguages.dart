import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';


import '../../../../Notofication_screen.dart';
import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import '../../../../Utils/validators/validation.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
          title: const Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
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
                            Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>NewNavbar(initTabIndex: 3,)),
                          (Route<dynamic> route) => false,
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
