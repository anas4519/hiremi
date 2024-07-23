import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class ResumeSection extends StatefulWidget {
  const ResumeSection({super.key, required this.resumeLink,});

  final TextEditingController resumeLink;

  @override
  State<ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  String link =
      'https://drive.google.com/file/d/0B1HXnM1lBuoqMzVhZjcwNTAtZWI5OS00ZDg3LWEyM...';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Sizes.responsiveDefaultSpace(context)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.radiusSm),
            border: Border.all(width: 0.5, color: AppColors.secondaryText)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'images/icons/Resume.png',
                  height: 40,
                  width: 30,
                ),
                SizedBox(
                  width: Sizes.responsiveSm(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Resume Url',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          '(Google Drive Link)',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Note:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Try to upload pdf in your google drive if possible, ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Sizes.responsiveXxs(context),
                        ),
                        Text(
                          'Other formats are also accepted.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            SizedBox(
              height: Sizes.responsiveLg(context),
              child: TextField(
                controller: widget.resumeLink,
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
                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: 20
                  ),
                  prefixIcon: const Icon(
                    Icons.attach_file,
                    color: AppColors.black,
                    size: 9,
                  ),
                  hintText: 'Paste Link',
                  labelStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: Sizes.responsiveXs(context)),
                  alignLabelWithHint: true,
                  hintStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.secondaryText,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.secondaryText,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.secondaryText,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            SizedBox(
              height: Sizes.responsiveLg(context) * 1.06,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.radiusXs)),
                    padding: EdgeInsets.symmetric(
                        vertical: Sizes.responsiveHorizontalSpace(context),
                        horizontal: Sizes.responsiveMdSm(context)),
                  ),
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Save Resume',
                        style: TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.responsiveXs(context),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 8,
                        color: AppColors.white,
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
