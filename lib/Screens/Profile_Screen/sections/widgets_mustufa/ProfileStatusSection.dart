import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class ProfileStatusSection extends StatelessWidget {
  const ProfileStatusSection({super.key, required this.isVerified, });

  final bool isVerified;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Sizes.responsiveLg(context)),
            decoration: BoxDecoration(
                color: HexColor('#FBEEEE'),
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: AppColors.green)),
            child: Icon(
              Icons.person,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: Sizes.responsiveMd(context),
          ),
          Text('Harsh Pawar', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: Sizes.responsiveSm(context),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.responsiveVerticalSpace(context),
              horizontal: Sizes.responsiveHorizontalSpace(context),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 0.7,
                  color: isVerified ? AppColors.green:AppColors.primary,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isVerified?
                  'images/icons/verified.png':
                  'images/icons/notVerifiedIcon.png',
                  height: MediaQuery.of(context).size.width * 0.025,
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                SizedBox(
                  width: Sizes.responsiveXs(context),
                ),
                Text(
                  isVerified? 'Verified':'Not Verified',
                  style: TextStyle(
                    color: isVerified ? AppColors.green:AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Sizes.responsiveSm(context),
          ),
          Text('Last updated today',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              )),
        ],
      ),
    );
  }
}
