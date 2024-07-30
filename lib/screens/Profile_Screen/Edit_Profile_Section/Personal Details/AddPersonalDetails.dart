import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Edit_Profile_Section/Languages/AddLanguages.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import 'package:intl/intl.dart';

import '../../../../Notofication_screen.dart';
import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddPersonalDetails extends StatefulWidget {
  const AddPersonalDetails({
    super.key,
  });

  @override
  State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  final homeController = TextEditingController();
  final pinCodeController = TextEditingController();
  final localAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final dobController = TextEditingController();
  final nativeLanguage = TextEditingController();
  final categoryController = TextEditingController();
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
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  void validateGender() {
    if (controller.selectedGender.isEmpty) {
      setState(() {
        isGenderEmpty = true;
      });
    } else {
      setState(() {
        isGenderEmpty = false;
      });
    }
  }

  void validateMarital() {
    if (controller.selectedMaritalStatus.isEmpty) {
      setState(() {
        isMaritalStatusEmpty = true;
      });
    } else {
      setState(() {
        isMaritalStatusEmpty = false;
      });
    }
  }

  void validateAbled() {
    if (controller.differentlyAbled.isEmpty) {
      setState(() {
        isAbledEmpty = true;
      });
    } else {
      setState(() {
        isAbledEmpty = false;
      });
    }
  }

  bool isGenderEmpty = false;
  bool isMaritalStatusEmpty = false;
  bool isAbledEmpty = false;

  @override
  void initState() {
    super.initState();
    homeController.text = controller.homeTown.value;
    pinCodeController.text = controller.pinCode.value;
    localAddressController.text = controller.localAddress.value;
    permanentAddressController.text = controller.permanentAddress.value;
    dobController.text = controller.dob.value;
    categoryController.text = controller.category.value;
  }

  bool isValid() {
    return controller.selectedGender.isNotEmpty &&
        controller.selectedMaritalStatus.isNotEmpty &&
        controller.differentlyAbled.isNotEmpty;
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
              bottom: Sizes.responsiveXxl(context) * 2.4,
              left: Sizes.responsiveDefaultSpace(context)),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Personal Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Gender',
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
                  SizedBox(
                    height: Sizes.responsiveXxs(context),
                  ),
                  Obx(
                    () => Row(children: [
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Male',
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectedGender.value =
                                    value.toString();
                                validateGender();
                              }),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: controller.selectedGender.value == 'Male'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Female',
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectedGender.value =
                                    value.toString();
                                validateGender();
                              }),
                          Text(
                            'Female',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color:
                                    controller.selectedGender.value == 'Female'
                                        ? Colors.black
                                        : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Other',
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectedGender.value =
                                    value.toString();
                                validateGender();
                              }),
                          Text(
                            'Other',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color:
                                    controller.selectedGender.value == 'Other'
                                        ? Colors.black
                                        : AppColors.secondaryText),
                          )
                        ],
                      ),
                    ]),
                  ),
                  if (isGenderEmpty) buildRadioValidation(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Marital Status',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Sizes.responsiveXxs(context),
                  ),
                  Obx(
                    () => Row(children: [
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Single',
                              groupValue:
                                  controller.selectedMaritalStatus.value,
                              onChanged: (value) {
                                controller.selectedMaritalStatus.value =
                                    value.toString();
                                validateMarital();
                              }),
                          Text(
                            'Single',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: controller.selectedMaritalStatus.value ==
                                        'Single'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Married',
                              groupValue:
                                  controller.selectedMaritalStatus.value,
                              onChanged: (value) {
                                controller.selectedMaritalStatus.value =
                                    value.toString();
                                validateMarital();
                              }),
                          Text(
                            'Married',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: controller.selectedMaritalStatus.value ==
                                        'Married'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: Colors.blue,
                              value: 'Other',
                              groupValue:
                                  controller.selectedMaritalStatus.value,
                              onChanged: (value) {
                                controller.selectedMaritalStatus.value =
                                    value.toString();
                                validateMarital();
                              }),
                          Text(
                            'Other',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: controller.selectedMaritalStatus.value ==
                                        'Other'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
              if (isMaritalStatusEmpty) buildRadioValidation(),
              Row(
                children: [
                  Expanded(
                      child: TextFieldWithTitle(
                          controller: homeController,
                          title: 'Hometown',
                          validator: (value) =>
                              SValidator.validateEmptyText('Hometown', value),
                          hintText: 'eg: Bhopal')),
                  SizedBox(
                    width: Sizes.responsiveMd(context),
                  ),
                  Expanded(
                      child: TextFieldWithTitle(
                          controller: pinCodeController,
                          title: 'Pincode',
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pincode is required';
                            }
                            if (value.length > 9) {
                              return 'Provide Valid Pincode';
                            }
                            return null;
                          },
                          hintText: 'eg: 462023'))
                ],
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                  controller: localAddressController,
                  title: 'Local Address',
                  validator: (value) =>
                      SValidator.validateEmptyText('Local Address', value),
                  hintText: 'eg: House Number, Colony Name etc.'),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                  controller: permanentAddressController,
                  title: 'Permanent Address',
                  validator: (value) =>
                      SValidator.validateEmptyText('Permanent Address', value),
                  hintText: 'eg: House Number, Colony Name etc.'),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                title: 'Date of Birth (DOB)',
                hintText: 'DD/MM/YYYY',
                controller: dobController,
                readOnly: true,
                spaceBtwTextField: Sizes.responsiveMd(context),
                prefix: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: AppColors.secondaryText,
                ),
                validator: (value) =>
                    SValidator.validateEmptyText('DOB', value),
                textInputType: const TextInputType.numberWithOptions(),
                onTap: () => _selectDate(context, controller: dobController),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Are you differently abled?*',
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
                  Obx(
                    () => Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.blue,
                                value: 'Yes',
                                groupValue: controller.differentlyAbled.value,
                                onChanged: (value) {
                                  controller.differentlyAbled.value =
                                      value.toString();
                                  validateAbled();
                                }),
                            Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color:
                                      controller.differentlyAbled.value == 'Yes'
                                          ? Colors.black
                                          : AppColors.secondaryText),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.blue,
                                value: 'No',
                                groupValue: controller.differentlyAbled.value,
                                onChanged: (value) {
                                  controller.differentlyAbled.value =
                                      value.toString();
                                  validateAbled();
                                }),
                            Text(
                              'No',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color:
                                      controller.differentlyAbled.value == 'No'
                                          ? Colors.black
                                          : AppColors.secondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (isAbledEmpty) buildRadioValidation(),
                ],
              ),
              TextFieldWithTitle(
                  controller: categoryController,
                  title: 'Category (Optional)',
                  hintText: 'eg: General, OBC etc.'),
              SizedBox(
                height: Sizes.responsiveMd(context) * 2,
              ),
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
                            vertical: Sizes.responsiveHorizontalSpace(context),
                            horizontal: Sizes.responsiveMdSm(context)),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate() && isValid()) {
                          final details = {
                            'gender': controller.selectedGender.value,
                            'marital_status':
                                controller.selectedMaritalStatus.value,
                            'home_town': homeController.text,
                            'pincode': pinCodeController.text,
                            'local_address': localAddressController.text,
                            'permanent_address':
                                permanentAddressController.text,
                            'date_of_birth': dobController.text,
                            'ability': controller.differentlyAbled.value,
                            'category': categoryController.text,
                            'profile': controller.profileId.toString(),
                          };
                          final success =
                              await controller.addPersonalDetails(details);
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
                        } else {
                          validateAbled();
                          validateMarital();
                          validateGender();
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
                            borderRadius:
                                BorderRadius.circular(Sizes.radiusSm)),
                        padding: EdgeInsets.symmetric(
                            vertical: Sizes.responsiveSm(context),
                            horizontal: Sizes.responsiveMdSm(context)),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate() && isValid()) {
                          final details = {
                            'gender': controller.selectedGender.value,
                            'marital_status':
                                controller.selectedMaritalStatus.value,
                            'home_town': homeController.text,
                            'pincode': pinCodeController.text,
                            'local_address': localAddressController.text,
                            'permanent_address':
                                permanentAddressController.text,
                            'date_of_birth': dobController.text,
                            'ability': controller.differentlyAbled.value,
                            'category': categoryController.text,
                            'profile': controller.profileId.toString(),
                          };
                          final success =
                              await controller.addPersonalDetails(details);
                          if (success) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddLanguages()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        } else {
                          validateAbled();
                          validateMarital();
                          validateGender();
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
      ),
    );
  }

  Padding buildRadioValidation() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 12, right: 0),
      child: Text(
        'Please select an option',
        style: TextStyle(
            color: Colors.red[800], fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
