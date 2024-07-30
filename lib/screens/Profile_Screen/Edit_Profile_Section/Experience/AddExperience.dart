import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Edit_Profile_Section/Projects/AddProjects.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/screens/Drawer_Child_Screens/drawer_child.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import 'package:intl/intl.dart';

import '../../../../Notofication_screen.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key, this.profileId});

  final int? profileId;

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  String experience = '';
  String jobType = '';
  String isCurrentCompany = '';
  TextEditingController organizationController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController skillSetController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController leavingDateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = ProfileController.instance;

  _selectDate(
    BuildContext context, {
    required TextEditingController controller,
  }) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  bool isValid() {
    return experience.isNotEmpty &&
        jobType.isNotEmpty &&
        isCurrentCompany.isNotEmpty;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
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
                bottom: Sizes.responsiveXxl(context) * 2.5,
                left: Sizes.responsiveDefaultSpace(context)),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Experience',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Sizes.responsiveMd(context),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Do you have work experience?',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'YES',
                              groupValue: experience,
                              onChanged: (value) => setState(() {
                                experience = 'YES';
                              }),
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: experience == 'YES'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'NO',
                              groupValue: experience,
                              onChanged: (value) {
                                setState(() {
                                  experience = 'NO';
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: experience == 'NO'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What type of work environment do you prefer?',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'On-Site',
                              groupValue: jobType,
                              onChanged: (value) => setState(() {
                                jobType = 'On-Site';
                              }),
                            ),
                            Text(
                              'On-Site',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: jobType == 'On-Site'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'Hybrid',
                              groupValue: jobType,
                              onChanged: (value) => setState(() {
                                jobType = 'Hybrid';
                              }),
                            ),
                            Text(
                              'Hybrid',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: jobType == 'Hybrid'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'Remote',
                              groupValue: jobType,
                              onChanged: (value) {
                                setState(() {
                                  jobType = 'Remote';
                                });
                              },
                            ),
                            Text(
                              'Remote',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: jobType == 'Remote'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWithTitle(
                            controller: organizationController,
                            title: 'Organization Name',
                            hintText: 'eg: Google',
                            validator: (value) => SValidator.validateEmptyText(
                                'Organization', value),
                          ),
                        ),
                        SizedBox(
                          width: Sizes.responsiveMd(context),
                        ),
                        Expanded(
                          child: TextFieldWithTitle(
                            controller: jobTitleController,
                            title: 'Job Title',
                            hintText: 'eg: Software Developer',
                            validator: (value) => SValidator.validateEmptyText(
                                'Job Title', value),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Sizes.responsiveMd(context),
                    ),
                    TextFieldWithTitle(
                      controller: skillSetController,
                      title: 'SkillSet Used(Optional)',
                      hintText: 'eg: Java, Python etc.',
                    ),
                    SizedBox(
                      height: Sizes.responsiveMd(context),
                    ),
                    TextFieldWithTitle(
                      controller: joiningDateController,
                      title: 'Joining Date',
                      hintText: 'DD/MM/YYYY',
                      prefix: Icon(
                        Icons.calendar_month_sharp,
                        size: 16,
                        color: AppColors.secondaryText,
                      ),
                      readOnly: true,
                      textInputType: const TextInputType.numberWithOptions(),
                      validator: (value) =>
                          SValidator.validateEmptyText('Year', value),
                      onTap: () => _selectDate(context,
                          controller: joiningDateController),
                    ),
                    SizedBox(
                      height: Sizes.responsiveMd(context),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Is this your current company?',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'YES',
                              groupValue: isCurrentCompany,
                              onChanged: (value) => setState(() {
                                isCurrentCompany = 'YES';
                              }),
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: isCurrentCompany == 'YES'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.blue,
                              value: 'NO',
                              groupValue: isCurrentCompany,
                              onChanged: (value) {
                                setState(() {
                                  isCurrentCompany = 'NO';
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: isCurrentCompany == 'NO'
                                      ? Colors.black
                                      : AppColors.secondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                    TextFieldWithTitle(
                      controller: leavingDateController,
                      title: 'Leaving Date, if “No” selected above.',
                      hintText: 'DD/MM/YYYY',
                      prefix: Icon(
                        Icons.calendar_month_sharp,
                        size: 16,
                        color: AppColors.secondaryText,
                      ),
                      readOnly: true,
                      validator: (value) => isCurrentCompany == 'No'
                          ? SValidator.validateEmptyText('Leaving Date', value)
                          : null,
                      textInputType: const TextInputType.numberWithOptions(),
                      onTap: () => _selectDate(context,
                          controller: leavingDateController),
                    ),
                    SizedBox(height: Sizes.responsiveMd(context) * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
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
                            onPressed: () async {
                              if (formKey.currentState!.validate() &&
                                  isValid()) {
                                final success = await controller.addExperience(
                                    experience,
                                    jobType,
                                    organizationController.text,
                                    jobTitleController.text,
                                    skillSetController.text,
                                    joiningDateController.text,
                                    isCurrentCompany,
                                    leavingDateController.text ?? '');
                                if (success) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewNavbar(
                                              initTabIndex: 3,
                                            )),
                                    (Route<dynamic> route) => false,
                                  );
                                } else {}
                                //   Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => NewNavbar(
                                //               initTabIndex: 3,
                                //             )),
                                //     (Route<dynamic> route) => false,
                                //   );
                                // }
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
                              side: BorderSide(
                                  color: AppColors.primary, width: 0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.radiusSm)),
                              padding: EdgeInsets.symmetric(
                                  vertical: Sizes.responsiveSm(context),
                                  horizontal: Sizes.responsiveMdSm(context)),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate() &&
                                  isValid()) {
                                final success = await controller.addExperience(
                                    experience,
                                    jobType,
                                    organizationController.text,
                                    jobTitleController.text,
                                    skillSetController.text,
                                    joiningDateController.text,
                                    isCurrentCompany,
                                    leavingDateController.text ?? '');
                                if (success) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddProjects()),
                                    (Route<dynamic> route) => false,
                                  );
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddProjects()),
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
        ));
  }
}
