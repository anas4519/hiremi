import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/widgets/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class KeySkills extends StatelessWidget {
   const KeySkills({super.key, this.onTap, this.skills,
  });

  final List<String>? skills ;

   final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      title: 'Key Skills',
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(skills!.isNotEmpty)
          SizedBox(height: Sizes.responsiveMd(context)),
          Wrap(
              runSpacing: 10,
              spacing: Sizes.responsiveSm(context),
              children: (skills?? []).map((skill) => RoundedContainer(
                    radius: 16,
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.responsiveHorizontalSpace(context),
                      vertical: Sizes.responsiveVerticalSpace(context),
                    ),
                    border: Border.all(width: 0.5, color: AppColors.primary),
                    child: Text(
                      skill,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  )
              ).toList()
          ),
        ],
      ),
    );
  }
}
