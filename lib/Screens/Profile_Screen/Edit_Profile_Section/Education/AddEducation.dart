import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/Profile_Screen.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../../../Notofication_screen.dart';
import '../../../../Utils/validators/validation.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import '../Experience/AddExperience.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({
    super.key,
  });

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  final educationController = TextEditingController();
  final courseController = TextEditingController();
  final yearController = TextEditingController();
  final marksController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> listOfEducationLevels = [
    'High School',
    'Intermediate',
    'Diploma',
    'Bachelor',
    'Master',
    'Doctorate',
  ];

  Map<String, List<String>> educationToCourses = {
    'High School': ['Science', 'Commerce', 'Arts'],
    'Intermediate': ['Science', 'Commerce', 'Arts'],
    'Diploma': ['Diploma in Engineering', 'Diploma in Computer Science'],
    'Bachelor': [
      'Bachelor of Technology (B.Tech)',
      'Bachelor of Engineering (B.E)',
      'Bachelor of Computer Applications (BCA)',
      'B.Sc IT',
      'B.Sc CS',
    ],
    'Master': [
      'Master of Technology (M.Tech)',
      'Master of Engineering (M.E)',
      'Master of Computer Applications (MCA)',
      'M.Sc IT',
      'M.Sc CS',
    ],
    'Doctorate': [
      'PhD in Technology',
      'PhD in Engineering',
      'PhD in Computer Science'
    ],
  };

  List<String> listOfCourses = [];

  final controller = ProfileController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Padding(
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
                'Education',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              buildLabeledTextField(
                context,
                'Education',
                'Education Level',
                controller: educationController,
                dropdownItems: listOfEducationLevels,
                validator: (value) =>
                    SValidator.validateEmptyText('Education', value),
                onChanged: (newValue) {
                  setState(() {
                    educationController.text = newValue!;
                    listOfCourses = educationToCourses[newValue] ?? [];
                    courseController.clear();
                  });
                },
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              buildLabeledTextField(
                context,
                'Subject/Course',
                'Select Subject or Course Level',
                controller: courseController,
                dropdownItems: listOfCourses,
                validator: (value) =>
                    SValidator.validateEmptyText('Course', value),
                onChanged: (value) {
                  courseController.text = value!;
                }
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                controller: yearController,
                title: 'Passing Out Year',
                hintText: 'eg: 2024',
                suffix: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.black,
                  size: 18,
                ),
                readOnly: true,
                textInputType: const TextInputType.numberWithOptions(),
                validator: (value) =>
                    SValidator.validateEmptyText('Year', value),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light(),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    setState(() {
                      yearController.text = picked.year.toString();
                    });
                  }
                },
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                controller: marksController,
                title: 'Marks/Percentage/Grade/CGPA',
                hintText: 'eg: 84.99%',
                validator: (value) =>
                    SValidator.validateEmptyText('Marks', value),
                textInputType: const TextInputType.numberWithOptions(),
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
                            borderRadius:
                                BorderRadius.circular(Sizes.radiusSm)),
                        padding: EdgeInsets.symmetric(
                            vertical: Sizes.responsiveHorizontalSpace(context),
                            horizontal: Sizes.responsiveMdSm(context)),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.addEducationDetail({
                            'educationLevel': educationController.text,
                            'course': courseController.text,
                            'year': yearController.text,
                            'marks': marksController.text,
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.addEducationDetail({
                            'educationLevel': educationController.text,
                            'course': courseController.text,
                            'year': yearController.text,
                            'marks': marksController.text,
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddExperience()));
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
