import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class Experienced_Jobs extends StatefulWidget {
  const Experienced_Jobs({
    Key? key,
  }) : super(key: key);

  @override
  State<Experienced_Jobs> createState() => _Experienced_JobsState();
}

class _Experienced_JobsState extends State<Experienced_Jobs> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Experienced Jobs",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('images/Frame 110.png'),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available Experienced Jobs (1)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth*0.04),
            child: OpportunityCard(
                dp: Image.asset('images/icons/logo1.png'),
                profile: 'Senior Java Programmer',
                companyName: 'CRTD Technologies',
                location: 'Bhopal, Madhya Pradesh, India',
                stipend: '9.75 LPA',
                mode: 'Remote',
                exp: 10,
                type: 'Job',
                daysPosted: 6,
                ctc: 'g',
                description: 'description',
                education: 'BE/B.TECH/M.TECH/MCA/MBA/BCA/BSC/MSC',
                skillsRequired: 'skillsRequired',
                whoCanApply: 'whoCanApply',
                eligible: 'eligible'),
          )
          // Image.asset('images/Team work-bro.png'),
          // SizedBox(
          //   height: screenHeight * 0.01,
          // ),
          // const Text(
          //   'Hiremi’s Recruiters are planning for new jobs',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          //   textAlign: TextAlign.center,
          // ),
          // const Text(
          //   'and roles, please wait for few days',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
