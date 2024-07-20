import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/Custom_Widget/drawer_child.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:intl/intl.dart';

class QueriesScreen extends StatefulWidget {
  const QueriesScreen({Key? key}) : super(key: key);

  @override
  State<QueriesScreen> createState() => _QueriesScreenState();
}

class _QueriesScreenState extends State<QueriesScreen> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _showVerificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const CustomAlertbox());
      },
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        child: DrawerChild(),
      ),
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
          "Queries",
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
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.00),
                  child: Image.asset(
                    'images/At the office-pana.png',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Full Name', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Email Address', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Date of Birth', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      style: const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.green,
                        ),
                        hintText: 'Date of Birth',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Query Type', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: 'Career Problem',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Discuss Your Problem (Optional)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0, // Adjusted font size
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      maxLines: 3,
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Your Problem',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC1272D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Generate Query',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Adjusted bottom space
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
