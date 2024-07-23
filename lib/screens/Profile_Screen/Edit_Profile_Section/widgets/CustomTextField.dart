import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    required this.controller, required this.hintText, this.textInputType = TextInputType.text,  this.maxLines,  this.suffix, this.prefix, this.validator, this.readOnly = false, this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool readOnly;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      cursorColor: AppColors.black,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      expands: false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix,
        prefixIcon: prefix,
        suffixIconColor: AppColors.secondaryText,
        contentPadding: EdgeInsets.symmetric(
            vertical: Sizes.responsiveSm(context),
            horizontal: Sizes.responsiveMd(context)),
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.25),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: AppColors.secondaryText,
            width: 0.37,
          ),
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
    );
  }
}
