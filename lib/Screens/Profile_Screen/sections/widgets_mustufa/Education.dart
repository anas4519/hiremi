import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

import '../../widgets/CustomContainer/OutlinedButton.dart';

class Education extends StatelessWidget {
  const Education({
    super.key, this.education, this.onTap,
  });

  final List<Map<String, String>>? education;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      onTap: onTap,
      title: 'Education',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(education!.isNotEmpty)
          SizedBox(height: Sizes.responsiveMd(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: education!
                .map((edu) => EducationChild(
                    course: edu['educationLevel']!,
                    place: edu['course']!,
                    duration: edu['year']!,
                    marks: edu['marks']!,
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class EducationChild extends StatelessWidget {
  const EducationChild({
    super.key,
    required this.course,
    required this.place,
    required this.duration, required this.marks,
  });

  final String course, place, duration,marks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course,
          style: const TextStyle(
            fontSize: 9.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Text(
          place,
          style: const TextStyle(
            fontSize: 7.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: Sizes.responsiveXxs(context),
        ),
        Text(
          '$duration | Percentage: $marks%',
          style: TextStyle(
            fontSize: 7.5,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryText,
          ),
        ),
        SizedBox(height: Sizes.responsiveSm(context)),
        Divider(
          height: 0.25,
          thickness: 0.25,
          color: AppColors.secondaryText,
        ),
        SizedBox(height: Sizes.responsiveMd(context)),
      ],
    );
  }
}
