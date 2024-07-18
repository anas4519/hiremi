import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

import '../../widgets/CustomContainer/OutlinedButton.dart';



class ProfileSummary extends StatelessWidget {
  const ProfileSummary({super.key, this.onTap, required this.summary,
  });

  final String summary;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  OutlinedContainer(
      onTap: onTap,
      title: 'Profile Summary',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(summary.isNotEmpty)
          SizedBox(height: Sizes.responsiveMd(context)),
           if(summary.isNotEmpty)
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  summary,
                  style: const TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}