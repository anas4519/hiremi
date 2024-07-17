import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

import '../../../../Custom_Widget/CustomContainer/OutlinedButton.dart';


class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    this.onTap,
    required this.gender,
    required this.mStatus,
    required this.dob,
    required this.cAddress,
    required this.pAddress,
    required this.differentlyAbled,
    required this.category, required this.pinCode,
  });

  final String gender,
      mStatus,
      dob,
      cAddress,
      pAddress,
      differentlyAbled,
  pinCode,
      category;
  final void Function()? onTap;

  isValid() {
    return gender.isNotEmpty &&
        mStatus.isNotEmpty &&
        dob.isNotEmpty &&
        cAddress.isNotEmpty &&
        pinCode.isNotEmpty &&
        pAddress.isNotEmpty &&
        differentlyAbled.isNotEmpty &&
        pAddress.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
        onTap: onTap,
        title: 'Personal Details',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (isValid()) SizedBox(height: Sizes.responsiveMd(context)),
          if (isValid())
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInfoChild(
                  title: 'Gender',
                  subtitle: gender,
                ),
                PersonalInfoChild(
                  title: 'Marital Status',
                  subtitle: mStatus,
                ),
                PersonalInfoChild(title: 'Date of Birth (DOB)', subtitle: dob),
                PersonalInfoChild(
                  title: 'Current Address',
                  subtitle: '$cAddress - $pinCode',
                ),
                PersonalInfoChild(
                  title: 'Permeant Address',
                  subtitle: pAddress,
                ),
                PersonalInfoChild(
                    title: 'Differently Abled', subtitle: differentlyAbled),
                if (category.isNotEmpty)
                  PersonalInfoChild(title: 'Category', subtitle: category),
              ],
            ),
        ]));
  }
}

class PersonalInfoChild extends StatelessWidget {
  const PersonalInfoChild({
    super.key,
    required this.title,
    required this.subtitle,
    this.pincode,
  });

  final String? title, subtitle, pincode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
              fontSize: 9.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Text(
          subtitle! ,
          style: TextStyle(
              fontSize: 9.0,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText),
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Divider(
          height: 0.25,
          thickness: 0.25,
          color: AppColors.secondaryText,
        ),
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
      ],
    );
  }
}
