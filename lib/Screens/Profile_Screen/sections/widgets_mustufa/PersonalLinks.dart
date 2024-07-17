import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/screens/Profile_Screen/controller/ProfileController.dart';

import '../../../../Custom_Widget/CustomContainer/OutlinedButton.dart';

class PersonalLinks extends StatefulWidget {
  const PersonalLinks({
    super.key,
  });

  @override
  State<PersonalLinks> createState() => _PersonalLinksState();
}

class _PersonalLinksState extends State<PersonalLinks> {
  TextEditingController linkTitle = TextEditingController();

  TextEditingController personalLink = TextEditingController();

  final controller = ProfileController.instance;

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      showEdit: false,
      title: 'Add Links',
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
                        platform: linksData['title'] ?? '',
                        link: linksData['link'] ?? '')),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: Sizes.responsiveLg(context) * 1.1,
                        child: TextField(
                          controller: linkTitle,
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
                              Icons.add_link,
                              size: 11,
                            ),
                            hintText: 'Link Title',
                            prefixIconConstraints: const BoxConstraints(
                                minHeight: 20, minWidth: 25),
                            contentPadding: EdgeInsets.only(
                                left: Sizes.responsiveSm(context) * 1.15,
                                top: Sizes.responsiveSm(context) * 0.7,
                                bottom: Sizes.responsiveSm(context) * 0.9),
                            alignLabelWithHint: true,
                            hintStyle: const TextStyle(
                              fontSize: 8,
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
                      onPressed: () {
                        if (linkTitle.text.isNotEmpty &&
                            personalLink.text.isNotEmpty) {
                          controller.addPersonalLinks(
                              linkTitle.text, personalLink.text);
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
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalLinksChild extends StatelessWidget {
  const PersonalLinksChild({
    super.key,
    required this.platform,
    required this.link,
  });

  final String platform, link;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinkTitleChild(platform: platform),
            SizedBox(
              width: Sizes.responsiveSm(context),
            ),
            MainLink(link: link)
          ],
        ),
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
      ],
    );
  }
}

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
          color: AppColors.green,
          border: Border.all(width: 0.5, color: AppColors.secondaryText),
          radius: 2,
          padding: EdgeInsets.only(
              left: Sizes.responsiveSm(context) * 1.15,
              top: Sizes.responsiveSm(context) * 0.9,
              bottom: Sizes.responsiveSm(context) * 0.9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_link,
                size: 9,
                color: AppColors.white,
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
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
