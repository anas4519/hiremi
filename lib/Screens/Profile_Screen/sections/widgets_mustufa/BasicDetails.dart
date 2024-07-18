import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/widgets/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class BasicDetails extends StatelessWidget {
  const BasicDetails({super.key, required this.lookingFor, required this.city, required this.state, required this.email, required this.phoneNumber, required this.whatsappNumber, required this.onTap,
  });

  final String lookingFor;
  final String city;
  final String state;
  final String email;
  final String phoneNumber;
  final String whatsappNumber;
  final void Function() onTap;

  isValid(){
    return
      lookingFor.isNotEmpty &&
          city.isNotEmpty &&
          state.isNotEmpty &&
          email.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          whatsappNumber.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      onTap: onTap,
      title: 'Basic Details',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if(isValid())
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
          if(isValid())
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    size: 10,
                    color: AppColors.secondaryText,
                  ),
                  SizedBox(
                    width: Sizes.responsiveXxs(context),
                  ),
                  const Text('Looking for ',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      )),
                  Text(lookingFor,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      )),
                ],
              ),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
               BasicDetailsChild(
                icon: Icons.add_location_alt,
                title: '$city, $state ',
              ),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
               BasicDetailsChild(icon: Icons.mail_outline, title: email),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
               BasicDetailsChild(icon: Icons.call_outlined, title: '+91$phoneNumber'),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
               BasicDetailsChild(
                  icon: Icons.message_outlined, title: '+91$whatsappNumber'),
            ],
          )
      ]),
    );
  }
}

class BasicDetailsChild extends StatelessWidget {
  const BasicDetailsChild({super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 10,
          color: AppColors.secondaryText,
        ),
        SizedBox(width: Sizes.responsiveXxs(context)),
        Text(title,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            )),
      ],
    );
  }
}
