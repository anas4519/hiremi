import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/widgets/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class Languages extends StatelessWidget {
  const Languages({super.key, this.onTap, this.languages});

  final List<String>? languages;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      onTap: onTap,
      title: 'Languages',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (languages!.isNotEmpty)
          SizedBox(height: Sizes.responsiveMd(context)),
        if (languages != null && languages!.isNotEmpty)
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: languages!
                .map((language) => RoundedContainer(
                      radius: 16,
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.responsiveHorizontalSpace(context),
                        vertical: Sizes.responsiveVerticalSpace(context),
                      ),
                      border: Border.all(width: 0.5, color: AppColors.primary),
                      child: Text(
                        language,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ))
                .toList(),
          ),
      ]),
    );
  }
}
