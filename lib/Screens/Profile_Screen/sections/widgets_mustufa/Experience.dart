import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

import '../../widgets/CustomContainer/OutlinedButton.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
    this.onTap,
    this.experience,
  });

  final List<Map<String, String>>? experience;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      title: 'Experience',
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (experience!.isNotEmpty) SizedBox(height: Sizes.responsiveMd(context)),
          if (experience != null)
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: experience!
                    .map((experience) => ExperienceChild(
                        title: experience['jobTitle']!,
                        jobType: experience['jobType']!,
                        company: experience['organization']!,
                        startingTime: experience['joiningDate']!,
                        leavingTime: experience['leavingDate']!))
                    .toList()),
        ],
      ),
    );
  }
}

class ExperienceChild extends StatelessWidget {
  const ExperienceChild({
    super.key,
    required this.title,
    required this.jobType,
    required this.company,
    required this.startingTime,
    required this.leavingTime,
  });

  final String? title, jobType, company, startingTime, leavingTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.apartment,
          size: 25,
          color: AppColors.primary,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveXs(context),
            ),
            Text(
              jobType!,
              style: const TextStyle(
                fontSize: 6.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveXxs(context),
            ),
            Text(
              company!,
              style: const TextStyle(
                fontSize: 6.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveXxs(context),
            ),
            Text(
              '$jobType • $startingTime - ${leavingTime ?? 'Present'}',
              style: TextStyle(
                fontSize: 6.5,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText,
              ),
            ),
            Divider(
              height: 0.25,
              thickness: 0.25,
              color: AppColors.secondaryText,
            ),
            SizedBox(height: Sizes.responsiveMd(context)),
          ],
        )
      ],
    );
  }
}
