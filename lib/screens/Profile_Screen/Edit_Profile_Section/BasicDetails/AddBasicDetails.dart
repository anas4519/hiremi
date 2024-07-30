import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Edit_Profile_Section/ProfileSummary/ProfileSummary.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/screens/Drawer_Child_Screens/drawer_child.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../widgets/TextFieldWithTitle.dart';

class AddBasicDetails extends StatefulWidget {
  const AddBasicDetails({
    super.key,
  });

  @override
  State<AddBasicDetails> createState() => _AddBasicDetailsState();
}

class _AddBasicDetailsState extends State<AddBasicDetails> {
  String opportunity = '';
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsappController = TextEditingController();

  GlobalKey<FormState> bdKey = GlobalKey<FormState>();
  final controller = ProfileController.instance;

  List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry',
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLookingForEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cityController.text = controller.city.value;
      stateController.text = controller.state.value;
      emailController.text = controller.email.value;
      phoneController.text = controller.phoneNumber.value;
      whatsappController.text = controller.whatsappNumber.value;
    });
  }

  bool validateLookingFor() {
    if (controller.lookingFor.value.isEmpty) {
      setState(() {
        isLookingForEmpty = true;
      });
      return true;
    } else {
      setState(() {
        isLookingForEmpty = false;
      });
      return false;
    }
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
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            top: Sizes.responsiveXl(context),
            right: Sizes.responsiveDefaultSpace(context),
            bottom: kToolbarHeight,
            left: Sizes.responsiveDefaultSpace(context)),
        child: Obx(
          () => Form(
            key: bdKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Basic Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Row(
                children: [
                  const Text(
                    'Looking for',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                height: Sizes.responsiveMd(context),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context) * 1.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.blue,
                            value: 'Internships',
                            groupValue: controller.lookingFor.value,
                            onChanged: (value) {
                              controller.lookingFor.value = value as String;
                              validateLookingFor();
                            }),
                        const Text(
                          'Internships',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.blue,
                            value: 'Fresher Jobs',
                            groupValue: controller.lookingFor.value,
                            onChanged: (value) {
                              controller.lookingFor.value = value as String;
                              validateLookingFor();
                            }),
                        const Text(
                          'Fresher Jobs',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: Colors.blue,
                            value: 'Experienced Jobs',
                            groupValue: controller.lookingFor.value,
                            onChanged: (value) {
                              controller.lookingFor.value = value as String;
                              validateLookingFor();
                            }),
                        const Text(
                          'Experienced Jobs',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              if (isLookingForEmpty) buildRadioValidation(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                controller: cityController,
                title: 'City',
                hintText: 'eg: Bhopal',
                validator: (value) =>
                    SValidator.validateEmptyText('City', value),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              buildLabeledTextField(
                context,
                'State',
                'Assam',
                controller: stateController,
                dropdownItems: states,
                validator: (value) =>
                    SValidator.validateEmptyText('State', value),
                onChanged: (value) => setState(() {
                  stateController.text = value!;
                }),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                controller: emailController,
                title: 'Email Address',
                hintText: 'abc@gmail.com',
                validator: (value) => SValidator.validateEmail(value),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                  controller: phoneController,
                  title: 'Phone Number',
                  hintText: '9988776563',
                  validator: (value) =>
                      SValidator.validatePhoneNumber(value, 'Phone'),
                  textInputType: TextInputType.number),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                  controller: whatsappController,
                  title: 'WhatsApp Number',
                  hintText: '9988776563',
                  validator: (value) =>
                      SValidator.validatePhoneNumber(value, 'WhatsApp'),
                  textInputType: TextInputType.number),
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
                        if (bdKey.currentState!.validate() &&
                            !isLookingForEmpty) {
                          final details = {
                            "looking_for":
                                controller.lookingFor.value.toString(),
                            "city": cityController.text.toString(),
                            "state": stateController.text.toString(),
                            "email": emailController.text.toString(),
                            "phone_number": phoneController.text.toString(),
                            "whatsapp_number":
                                whatsappController.text.toString(),
                            "profile": controller.profileId.value.toString(),
                          };
                          final response =
                              await controller.addBasicDetails(details);
                          if (response) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewNavbar(
                                        initTabIndex: 3,
                                      )),
                              (Route<dynamic> route) => false,
                            );
                          }
                        } else {
                          validateLookingFor();
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
                        if (bdKey.currentState!.validate() &&
                            !isLookingForEmpty) {
                          final details = {
                            "looking_for":
                                controller.lookingFor.value.toString(),
                            "city": cityController.text.toString(),
                            "state": stateController.text.toString(),
                            "email": emailController.text.toString(),
                            "phone_number": phoneController.text.toString(),
                            "whatsapp_number":
                                whatsappController.text.toString(),
                            "profile": controller.profileId.value.toString(),
                          };
                          final response =
                              await controller.addBasicDetails(details);
                          if (response) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddProfileSummary()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        } else {
                          validateLookingFor();
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
              ),
              const SizedBox(
                height: 64,
              )
            ]),
          ),
        ),
      )),
    );
  }

  Padding buildRadioValidation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Text(
        'Please select an option',
        style: TextStyle(
            color: Colors.red[800], fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget buildLabeledTextField(
    BuildContext context,
    String label,
    String hintText, {
    bool showPositionedBox = false,
    IconData? prefixIcon,
    bool obscureText = false,
    List<String>? dropdownItems,
    TextEditingController? controller,
    String? Function(String?)? validator,
    VoidCallback? onTap,
    void Function(String?)? onChanged,
    TextInputType? keyboardType,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
            TextSpan(
              text: " *",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
          ],
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
      DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 0.37,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 0.37,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 0.37,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 0.37,
            ),
          ),
        ),
        value: controller?.text.isNotEmpty == true ? controller?.text : null,
        hint: Text(hintText),
        onChanged: onChanged,
        items: dropdownItems!.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        validator: validator,
      ),
    ]);
  }
}
