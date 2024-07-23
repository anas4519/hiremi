import 'package:flutter/material.dart';

import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';
import 'CustomTextField.dart';



class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.starNeeded = true,
    this.prefix,
    this.suffix,
    this.spaceBtwTextField,
    this.maxLines, this.validator, this.textInputType = TextInputType.text,  this.readOnly = false, this.onTap,
  });

  final TextEditingController controller;
  final String title, hintText;
  final bool starNeeded;
  final Widget? prefix, suffix;
  final double? spaceBtwTextField;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final bool readOnly;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            if (starNeeded)
              Text(
                '*',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
        SizedBox(
          height: spaceBtwTextField ?? Sizes.responsiveSm(context),
        ),
        CustomTextField(
            controller: controller,
            hintText: hintText,
            prefix: prefix,
            suffix: suffix,
            validator: validator,
            textInputType: textInputType,
            readOnly: readOnly,
            onTap: onTap,
            maxLines: maxLines),
      ],
    );
  }
}
