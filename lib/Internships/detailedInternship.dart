import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Eligibility_Criteria_About_Company.dart';
import 'package:hiremi_version_two/Fresher_Jobs/roleDetails.dart';
import 'package:hiremi_version_two/Fresher_Jobs/skillsRequired.dart';
import 'package:hiremi_version_two/Internships/HeaderSectionInternship.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class DetailedInternship extends StatefulWidget {
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

  const DetailedInternship({
    super.key,
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
  });

  @override
  State<DetailedInternship> createState() => _DetailedInternshipState();
}

class _DetailedInternshipState extends State<DetailedInternship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Internships',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              HeaderSectionInternship(
                profile: widget.profile,
                companyName: widget.companyName,
                location: widget.location,
                ctc: widget.ctc,
              ),

              Divider(),
              SizedBox(height: Sizes.responsiveXl(context) * 0.5),

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
              EligibilityCriteriaAboutCompanyFresher(),
            ],
          ),
        ),
      ),
    );
  }
}
