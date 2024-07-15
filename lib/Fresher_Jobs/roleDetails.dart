import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class RoleDetailsFresher extends StatelessWidget {
  final String profile;
  final String location;
  final double ctc;
  final String description;

  const RoleDetailsFresher({
    Key? key,
    required this.profile,
    required this.location,
    required this.ctc,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 8.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.currency_rupee,
              size: 8,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              width: Sizes.responsiveXxs(context),
            ),
            Text(
              '₹$ctc',
              style: const TextStyle(
                fontSize: 8.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Text(
          description,
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
