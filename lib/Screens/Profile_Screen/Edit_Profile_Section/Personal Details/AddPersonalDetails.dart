import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:intl/intl.dart';

import '../../../../Notofication_screen.dart';
import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../../Profile_Screen.dart';
import '../../controller/ProfileController.dart';
import '../Languages/AddLanguages.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddPersonalDetails extends StatefulWidget {
  const AddPersonalDetails({super.key});

  @override
  State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  String selectedGender = '';
  String selectedMaritalStatus = '';
  String differentlyAbled = '';
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
        controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }


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
                bottom: Sizes.responsiveXxl(context) * 2.4,
                left: Sizes.responsiveDefaultSpace(context)),
            child: Form(
              key: formKey,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Details',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                                ()=> Row(children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.blue,
                                    value: 'Male',
                                    groupValue: controller.selectedGender.value,
                                    onChanged: (value) =>
                                      controller.selectedGender.value = 'Male',

                                  ),
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
                                    onChanged: (value) =>
                                      controller.selectedGender.value ='Female',
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: controller.selectedGender.value == 'Female'
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
                                    onChanged: (value) =>
                                      controller.selectedGender.value = 'Other',
                                  ),
                                  Text(
                                    'Other',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: controller.selectedGender.value == 'Other'
                                            ? Colors.black
                                            : AppColors.secondaryText),
                                  )
                                ],
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Marital Status',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Sizes.responsiveXxs(context),
                          ),
                          Obx(
                                ()=> Row(children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.blue,
                                    value: 'Single / Unmarried',
                                    groupValue: controller.selectedMaritalStatus.value,
                                    onChanged: (value) =>
                                      controller.selectedMaritalStatus.value = 'Single / Unmarried'
                                  ),
                                  Text(
                                    'Single / Unmarried',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: controller.selectedMaritalStatus.value ==
                                                'Single / Unmarried'
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
                                    groupValue: controller.selectedMaritalStatus.value,
                                    onChanged: (value) =>
                                      controller.selectedMaritalStatus.value =  'Married'
                                  ),
                                  Text(
                                    'Married',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: controller.selectedMaritalStatus.value == 'Married'
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
                                    groupValue: controller.selectedMaritalStatus.value,
                                    onChanged: (value) =>
                                      controller.selectedMaritalStatus.value = 'Other'
                                  ),
                                  Text(
                                    'Other',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: controller.selectedMaritalStatus.value == 'Other'
                                            ? Colors.black
                                            : AppColors.secondaryText),
                                  )
                                ],
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFieldWithTitle(
                                  controller: homeController,
                                  title: 'Hometown',
                                  validator: (value) =>
                                      SValidator.validateEmptyText(
                                          'Hometown', value),
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
                          validator: (value) => SValidator.validateEmptyText(
                              'Local Address', value),
                          hintText: 'eg: House Number, Colony Name etc.'),
                      SizedBox(
                        height: Sizes.responsiveMd(context),
                      ),
                      TextFieldWithTitle(
                          controller: permanentAddressController,
                          title: 'Permanent Address',
                          validator: (value) => SValidator.validateEmptyText(
                              'Permanent Address', value),
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
                        onTap: () =>
                            _selectDate(context, controller: dobController),
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
                                ()=> Row(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.blue,
                                      value: 'Yes',
                                      groupValue: controller.differentlyAbled.value,
                                      onChanged: (value) =>
                                        controller.differentlyAbled.value = 'Yes'
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                          color: controller.differentlyAbled.value == 'Yes'
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
                                      onChanged: (value) =>
                                          controller.differentlyAbled.value =  'No'
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                          color: differentlyAbled == 'No'
                                              ? Colors.black
                                              : AppColors.secondaryText),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                    vertical:
                                        Sizes.responsiveHorizontalSpace(context),
                                    horizontal: Sizes.responsiveMdSm(context)),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate() && isValid()) {
                                  controller.addPersonalDetails(
                                    homeController.text,
                                    pinCodeController.text,
                                    permanentAddressController.text,
                                    localAddressController.text,
                                    dobController.text,
                                    categoryController.text
                                  );
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => ProfileScreen()));
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
                              onPressed: () {
                                if (formKey.currentState!.validate() && isValid()) {
                                  controller.addPersonalDetails(
                                      homeController.text,
                                      pinCodeController.text,
                                      permanentAddressController.text,
                                      localAddressController.text,
                                      dobController.text,
                                      categoryController.text
                                  );
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const AddLanguages()));
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
}
