import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/core/utils/hex_color.dart';

Widget customTextField(
    {@required Widget? endIcon,
    required Widget? startIcon,
    required String? hintText,
    required bool isPassword,
    bool readOnly = false,
    VoidCallback? onPressed,
    VoidCallback? onTap,
    required TextEditingController controller,
    required TextInputType type,
    Function(String)? validator}) {
  return TextFormField(
    validator: (value) => validator!(value!),
    onTap: onTap,
    style: const TextStyle(color: Colors.black),
    obscureText: isPassword,
    controller: controller,
    keyboardType: type,
    readOnly: readOnly,
    decoration: InputDecoration(
      errorStyle: const TextStyle(color: BrandColors.primary),
      contentPadding: EdgeInsets.all(16.w),
      isDense: true,
      filled: true,
      fillColor: HexColor('#F7F8F8'),
      prefixIcon: startIcon,
      suffixIcon: endIcon != null
          ? IconButton(
              splashRadius: 5,
              onPressed: onPressed,
              icon: endIcon,
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(width: 1, color: BrandColors.primary)),
      hintMaxLines: 1,
      hintText: hintText,
      hintStyle: TextStyle(
          fontSize: 14.sp, fontFamily: 'Poppins', color: HexColor('#B5B5B5')),
    ),
  );
}
