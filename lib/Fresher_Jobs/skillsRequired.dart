import 'package:flutter/material.dart';

import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';

class SkillRequiredFresher extends StatelessWidget {
  const SkillRequiredFresher({super.key, required this.skillsRequired});
  final String skillsRequired;

  @override
  Widget build(BuildContext context) {
    List<String> skillsList = skillsRequired.split(',');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skill Required',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
        Row(
          children: skillsList.map((skill) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF6E5),
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.01),
              ),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
              child: Text(
                skill,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            );
          }).toList(),
        )
        // Text(
        //   skillsRequired,
        //   style: const TextStyle(
        //     fontSize: 8.0,
        //     fontWeight: FontWeight.w400,
        //     height: 1.5,
        //   ),
        // ),
      ],
    );
  }
}
