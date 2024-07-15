import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';

class SkillRequiredFresher extends StatelessWidget {
  final String skillsRequired;

  const SkillRequiredFresher({
    Key? key,
    required this.skillsRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills Required',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Text(
          skillsRequired,
          style: const TextStyle(
            fontSize: 8.0,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
