
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Eligibility_Criteria_About_Company.dart';
import 'package:hiremi_version_two/Fresher_Jobs/HeaderSectionFresher.dart';
import 'package:hiremi_version_two/Fresher_Jobs/roleDetails.dart';
import 'package:hiremi_version_two/Fresher_Jobs/skillsRequired.dart';

import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/SuccesfullyAppliedalert.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class DetailedFresherJobs extends StatefulWidget {
  final int id;
  final String profile;
  final String location;
  final String codeRequired;
  final int code;
  final String companyName;
  final String education;
  final String skillsRequired;
  final String? knowledgeStars;
  final String whoCanApply;
  final String description;
  final String termsAndConditions;
  final double ctc;
  final int exp;

  const DetailedFresherJobs({super.key, 
    required this.id,
    required this.profile,
    required this.location,
    required this.codeRequired,
    required this.code,
    required this.companyName,
    required this.education,
    required this.skillsRequired,
    this.knowledgeStars,
    required this.whoCanApply,
    required this.description,
    required this.termsAndConditions,
    required this.ctc,
    required this.exp
  });

  @override
  State<DetailedFresherJobs> createState() => _DetailedFresherJobsState();
}

class _DetailedFresherJobsState extends State<DetailedFresherJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          widget.exp>=2? 'Experienced Jobs':
          'Fresher Jobs',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.responsiveXl(context),
            right: Sizes.responsiveDefaultSpace(context),
            bottom: kToolbarHeight * 1.5,
            left: Sizes.responsiveDefaultSpace(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Sections
              HeaderSectionFresher(
                profile: widget.profile,
                companyName: widget.companyName,
                location: widget.location,
                ctc: widget.ctc,
                onTap:  ()=>showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: const SuccessfullyAppliedAlert());
                  },
                ),
              ),

              SizedBox(height: Sizes.responsiveXl(context)),

              /// Role Details
              RoleDetailsFresher(
                profile: widget.profile,
                location: widget.location,
                ctc: widget.ctc,
                description: widget.description,
              ),
              SizedBox(
                height: Sizes.responsiveLg(context),
              ),
              /// Skill Required
              SkillRequiredFresher(
                skillsRequired: widget.skillsRequired,
              ),
              SizedBox(
                height: Sizes.responsiveLg(context),
              ),

              /// Eligibility Criteria
              const EligibilityCriteriaAboutCompanyFresher(

              ),
            ],
          ),
        ),
      ),
    );
  }
}