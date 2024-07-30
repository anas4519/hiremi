import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/validators/validation.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:intl/intl.dart';

import '../../../../Notofication_screen.dart';
import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import '../../../Drawer_Child_Screens/drawer_child.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';
import '../Personal Details/AddPersonalDetails.dart';
import '../widgets/TextFieldWithTitle.dart';

class AddProjects extends StatefulWidget {
  const AddProjects({super.key});

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  TextEditingController titleController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController projectLinkController = TextEditingController();
  TextEditingController startingDateController = TextEditingController();
  TextEditingController completionDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String projectStatus = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
              bottom: Sizes.responsiveXxl(context) * 2.5,
              left: Sizes.responsiveDefaultSpace(context)),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Projects',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFieldWithTitle(
                          controller: titleController,
                          title: 'Project Title',
                          validator: (value) =>
                              SValidator.validateEmptyText('Title', value),
                          hintText: 'eg: Project Title')),
                  SizedBox(
                    width: Sizes.responsiveMd(context),
                  ),
                  Expanded(
                      child: TextFieldWithTitle(
                          controller: clientController,
                          title: 'Client',
                          validator: (value) =>
                              SValidator.validateEmptyText('Client', value),
                          hintText: 'eg: Organisation or Client etc.')),
                ],
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                  controller: projectLinkController,
                  title: 'Add Project Link',
                  validator: (value) =>
                      SValidator.validateEmptyText('Project Link', value),
                  hintText: 'eg: paste project link here.'),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                title: 'Starting Date',
                hintText: 'DD/MM/YYYY',
                spaceBtwTextField: Sizes.responsiveMd(context),
                controller: startingDateController,
                prefix: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: AppColors.secondaryText,
                ),
                readOnly: true,
                textInputType: const TextInputType.numberWithOptions(),
                validator: (value) =>
                    SValidator.validateEmptyText('Leaving Date', value),
                onTap: () =>
                    _selectDate(context, controller: startingDateController),
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
                        'Project Status',
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
                            value: 'Completed',
                            groupValue: projectStatus,
                            onChanged: (value) => setState(() {
                              projectStatus = 'Completed';
                            }),
                          ),
                          Text(
                            'Completed',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: projectStatus == 'Completed'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.blue,
                            value: 'Ongoing',
                            groupValue: projectStatus,
                            onChanged: (value) {
                              setState(() {
                                projectStatus = 'Ongoing';
                              });
                            },
                          ),
                          Text(
                            'Ongoing',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: projectStatus == 'Ongoing'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TextFieldWithTitle(
                title: 'Completion Date, if “Completed” selected above.',
                starNeeded: false,
                hintText: 'DD/MM/YYYY',
                controller: completionDateController,
                spaceBtwTextField: Sizes.responsiveMd(context),
                prefix: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: AppColors.secondaryText,
                ),
                readOnly: true,
                textInputType: const TextInputType.numberWithOptions(),
                validator: (value) => projectStatus == 'No'
                    ? SValidator.validateEmptyText('Leaving Date', value)
                    : null,
                onTap: () =>
                    _selectDate(context, controller: completionDateController),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              TextFieldWithTitle(
                title: 'Project Description',
                hintText: 'Tell us about your project...',
                controller: descriptionController,
                spaceBtwTextField: Sizes.responsiveMd(context),
                maxLines: 3,
                validator: (value) =>
                    SValidator.validateEmptyText('Project Description', value),
              ),
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
                        if (formKey.currentState!.validate() &&
                            projectStatus.isNotEmpty) {
                          final details = {
                            'project_title': titleController.text,
                            'client': clientController.text,
                            'link': projectLinkController.text,
                            'start_date': startingDateController.text,
                            'status': projectStatus,
                            'end_date' :  completionDateController.text,
                            'description': descriptionController.text,
                            'profile': controller.profileId.toString(),
                          };
                          final success = await controller.addProjects(details);
                          if (success) {
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
                            borderRadius:
                                BorderRadius.circular(Sizes.radiusSm)),
                        padding: EdgeInsets.symmetric(
                            vertical: Sizes.responsiveSm(context),
                            horizontal: Sizes.responsiveMdSm(context)),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate() &&
                            projectStatus.isNotEmpty) {
                          final details = {
                            'project_title': titleController.text,
                            'client': clientController.text,
                            'link': projectLinkController.text,
                            'start_date': startingDateController.text,
                            'status': projectStatus,
                            'end_date' :  completionDateController.text,
                            'description': descriptionController.text,
                            'profile': controller.profileId.toString(),
                          };
                          final success = await controller.addProjects(details);
                          if (success) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddPersonalDetails()),
                                  (Route<dynamic> route) => false,
                            );
                          }
                          else{}
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
