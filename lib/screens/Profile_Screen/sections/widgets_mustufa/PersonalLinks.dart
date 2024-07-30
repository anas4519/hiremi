import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../widgets/CustomContainer/OutlinedButton.dart';

class PersonalLinks extends StatefulWidget {
  const PersonalLinks({
    super.key,
    this.profileId,
  });

  final int? profileId;

  @override
  State<PersonalLinks> createState() => _PersonalLinksState();
}

class _PersonalLinksState extends State<PersonalLinks> {

  final controller = ProfileController.instance;



  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      title: 'Social Links',
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Sizes.responsiveMd(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...controller.personalLinks.map((linksData) =>
                    PersonalLinksChild(
                      linkedin: linksData['linkedin_url'].toString(),
                      github: linksData['github_url'].toString(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

class PersonalLinksChild extends StatefulWidget {

  const PersonalLinksChild({
    super.key, required this.linkedin, required this.github,
  });

  final String linkedin ,github;

  @override
  State<PersonalLinksChild> createState() => _PersonalLinksChildState();
}

class _PersonalLinksChildState extends State<PersonalLinksChild> {
  TextEditingController linkTitle = TextEditingController();

  TextEditingController personalLink = TextEditingController();
  List<String> linkTitleValues = [
    'LinkedIn',
    'GitHub',
  ];
  final controller = ProfileController.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.linkedin.isNotEmpty)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LinkTitleChild(platform:
            'Linked In'
            ),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            MainLink(link: widget.linkedin)
          ],
        ),
        if(widget.linkedin.isNotEmpty)
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
        if(widget.github.isNotEmpty)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LinkTitleChild(platform:
            'Github'
            ),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            MainLink(link: widget.github)
          ],
        ),
        if(widget.github.isNotEmpty)
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
        if(widget.github.isEmpty&& widget.linkedin.isEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                      height: Sizes.responsiveLg(context) * 1.1,
                      child: buildLabeledTextField(
                        context, 'label', 'Link Title',
                        prefixIcon: const Icon(
                          Icons.add_link,
                          size: 11,
                        ),
                        dropdownItems: linkTitleValues,
                        onChanged: (value) => linkTitle.text = value!,
                      )),
                ),
                SizedBox(
                  width: Sizes.responsiveSm(context),
                ),
                Expanded(
                  flex: 12,
                  child: SizedBox(
                    height: Sizes.responsiveLg(context) * 1.1,
                    child: TextField(
                      controller: personalLink,
                      cursorColor: AppColors.black,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                      expands: false,
                      cursorHeight: Sizes.responsiveMdSm(context),
                      cursorWidth: Sizes.responsiveXxs(context) * 0.6,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.attach_file,
                          size: 9,
                        ),
                        hintText: 'Paste Link',
                        labelStyle: const TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                            minHeight: 30, minWidth: 25),
                        contentPadding: EdgeInsets.only(
                            left: Sizes.responsiveSm(context) * 1.15,
                            top: Sizes.responsiveSm(context) * 0.7,
                            bottom: Sizes.responsiveSm(context) * 0.9),
                        alignLabelWithHint: true,
                        hintStyle: const TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: BorderSide(
                            color: AppColors.secondaryText,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: BorderSide(
                            color: AppColors.secondaryText,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: BorderSide(
                            color: AppColors.secondaryText,
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            SizedBox(
              height: Sizes.responsiveLg(context) * 1.06,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.radiusXs),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical:
                          Sizes.responsiveVerticalSpace(context) * 2,
                          horizontal: Sizes.responsiveMdSm(context))),
                  onPressed: () async {
                    if(linkTitle.text.isNotEmpty && personalLink.text.isNotEmpty){
                      final linkedinUrl = linkTitle.text == 'LinkedIn' ? personalLink.text: '';
                      final gitHubUrl = linkTitle.text == 'GitHub' ? personalLink.text: '';
                      final details = {
                        'linkedin_url' : linkedinUrl,
                        'github_url':gitHubUrl,
                        'profile' : controller.profileId.toString(),
                      };
                      await controller.addPersonalLinks(details);
                      linkTitle.clear();
                      personalLink.clear();
                    }
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Add Links ',
                        style: TextStyle(
                            fontSize: 8.5,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 8,
                        color: AppColors.white,
                      )
                    ],
                  )),
            )
          ],
        )
      ],
    );
  }
 Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        bool showPositionedBox = false,
        Widget? prefixIcon,
        bool obscureText = false,
        List<String>? dropdownItems,
        TextEditingController? controller,
        String? Function(String?)? validator,
        VoidCallback? onTap,
        void Function(String?)? onChanged,
        TextInputType? keyboardType,
      }) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      style: const TextStyle(
          fontSize: 8, fontWeight: FontWeight.w400, color: Colors.blue),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w400,
        ),
        prefixIconConstraints:
        const BoxConstraints(minHeight: 20, minWidth: 25),
        contentPadding: EdgeInsets.symmetric(vertical:Sizes.responsiveXs(context)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 0.37,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 0.37,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 0.37,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 0.37,
          ),
        ),
      ),
      value: controller?.text.isNotEmpty == true ? controller?.text : null,
      hint: Text(hintText),
      icon: const SizedBox(),
      onChanged: onChanged,
      items: dropdownItems!.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Center(
            child: Text(item, style: const TextStyle(fontSize: 8.5)), // Adjust font size as needed
          ),
        );
      }).toList(),
      validator: validator,
      menuMaxHeight: 100,
    );
  }}

class MainLink extends StatelessWidget {
  const MainLink({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: RoundedContainer(
          border: Border.all(width: 0.5, color: AppColors.green),
          radius: 2,
          padding: EdgeInsets.only(
              left: Sizes.responsiveSm(context) * 1.15,
              top: Sizes.responsiveSm(context) * 0.9,
              bottom: Sizes.responsiveSm(context) * 0.9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                  angle: pi * 1.5,
                  child: const Icon(
                    Icons.add_link,
                    size: 9.5,
                    color: Colors.blue,
                    weight: 1.4,
                  )),
              SizedBox(
                width: Sizes.responsiveHorizontalSpace(context),
              ),
              Expanded(
                child: Text(link,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue)),
              ),
            ],
          )),
    );
  }
}

class LinkTitleChild extends StatelessWidget {
  const LinkTitleChild({
    super.key,
    required this.platform,
  });

  final String platform;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: RoundedContainer(
          radius: 2,
          padding: EdgeInsets.only(
              top: Sizes.responsiveSm(context) * 0.9,
              bottom: Sizes.responsiveSm(context) * 0.9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                platform == 'Github'?
                'images/icons/GitHub.png':
                'images/icons/LinkedIn.png',
                height: 24,
                width:24,
              ),
              SizedBox(
                width: Sizes.responsiveHorizontalSpace(context),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: Sizes.responsiveSm(context)),
                  child: Text(platform,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
