import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../../../Notofication_screen.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../Education/AddEducation.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddKeySkills extends StatefulWidget {
  const AddKeySkills({
    super.key,
    this.profileId,
  });

  final int? profileId;

  @override
  State<AddKeySkills> createState() => _AddKeySkillsState();
}

class _AddKeySkillsState extends State<AddKeySkills> {
  final skillController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final success = await controller.addKeySkills(skillController.text);
                        if (success) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  NewNavbar(
                                  initTabIndex: 3,
                                )),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewNavbar(
                                      initTabIndex: 3,
                                    )),
                            (Route<dynamic> route) => false,
                          );
                        }
                      }
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final success = await controller.addKeySkills(skillController.text);
                        if (success) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddEducation()),
                                (Route<dynamic> route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewNavbar(
                                      initTabIndex: 3,
                                    )),
                                (Route<dynamic> route) => false,
                          );
                        }
                      }
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
