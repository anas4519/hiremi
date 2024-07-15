import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedImage.dart';
import 'package:hiremi_version_two/Custom_Widget/roundedContainer.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class HeaderSectionInternship extends StatelessWidget {
  final String profile;
  final String companyName;
  final String location;
  final double ctc;

  const HeaderSectionInternship({
    Key? key,
    required this.profile,
    required this.companyName,
    required this.location,
    required this.ctc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            RoundedImage(
                image: 'images/icons/logo1.png',
                border: Border.all(width: 5.0, color: AppColors.lightGrey)),
            SizedBox(
              width: Sizes.responsiveXs(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profile,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  companyName,
                  style: const TextStyle(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.av_timer,
                    size: 8,
                  ),
                  SizedBox(
                    width: Sizes.responsiveXxs(context),
                  ),
                  Text(
                    '6 days ago',
                    style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on_rounded,
                size: 8, color: AppColors.secondaryText),
            SizedBox(
              width: Sizes.responsiveXxs(context),
            ),
            Text(
              location,
              style: const TextStyle(
                fontSize: 8.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
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
        Row(
          children: [
            RoundedContainer(
                color: AppColors.lightOrange,
                radius: 2,
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.responsiveXs(context),
                    vertical: Sizes.responsiveXs(context)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shop,
                      color: AppColors.orange,
                      size: 8,
                    ),
                    SizedBox(
                      width: Sizes.responsiveXxs(context) * 1.5,
                    ),
                    const Text(
                      'Remote',
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            RoundedContainer(
                color: AppColors.lightOrange2,
                radius: 2,
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.responsiveXs(context),
                    vertical: Sizes.responsiveXs(context)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_alarms_rounded,
                      color: AppColors.primary,
                      size: 8,
                    ),
                    SizedBox(
                      width: Sizes.responsiveXxs(context) * 1.5,
                    ),
                    const Text(
                      'Internship',
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            RoundedContainer(
                color: AppColors.lightPink,
                radius: 2,
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.responsiveXs(context),
                    vertical: Sizes.responsiveXs(context)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.work,
                      color: AppColors.pink,
                      size: 8,
                    ),
                    SizedBox(
                      width: Sizes.responsiveXxs(context) * 1.5,
                    ),
                    const Text(
                      '1 Year Exp',
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
            const Spacer(),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            Icon(
              Icons.bookmark_border_rounded,
              size: 12,
              color: AppColors.secondaryText,
            ),
          ],
        )
      ],
    );
  }
}
