import 'package:flutter/material.dart';

import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';


class RoleDetailsFresher extends StatelessWidget {
  const RoleDetailsFresher({super.key,
  required this.profile,
    required this.location,
    required this.ctc,
    required this.description,
  });

  final String profile;
  final String location;
  final double ctc;
  final String description;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Title
        Text('Role : $profile',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        SizedBox(height: Sizes.responsiveLg(context)),
        Text(
          'Location: $location',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.green,
          ),
        ),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Salary: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.green,
              ),
            ),
            // Salary
             Text(
              '₹$ctc per month',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: Sizes.responsiveXl(context)),
        // About Job Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About the Role',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary)),
            SizedBox(
              height: Sizes.responsiveXs(context),
            ),
             Text(
              description,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: Sizes.responsiveXxs(context)),
              // First
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBulletPoint(
                      context: context,
                      number: '1.',
                      text:
                      'Sourcing and Recruiting: Identify and recruit potential candidates through various channels.'),
                  buildBulletPoint(
                      context: context,
                      number: '2.',
                      text:
                      'Screening Resumes: Evaluate candidate qualifications and skills.'),
                  buildBulletPoint(
                      context: context,
                      number: '3.',
                      text:
                      'Conducting Interviews: Arrange and conduct interviews with potential candidates.'),
                  buildBulletPoint(
                      context: context,
                      number: '4.',
                      text:
                      'Coordinating: Manage and coordinate with hiring managers to fulfill staffing needs.'),
                  buildBulletPoint(
                      context: context,
                      number: '5.',
                      text:
                      'Maintaining Records: Keep accurate records of all candidates and their status in the hiring process.'),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
Padding buildBulletPoint({required String text,
  required String number,
  required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Sizes.responsiveXxs(context)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number ',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    ),
  );
}


