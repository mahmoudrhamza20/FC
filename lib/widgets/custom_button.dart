import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/utils/brand_colors.dart';

Widget customButton(
    {required String text,
    required VoidCallback onTap,
    required BuildContext context}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 48.w,
      width: 200.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          color: BrandColors.primary),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.w,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
