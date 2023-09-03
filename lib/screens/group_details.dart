import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/widgets/custom_card.dart';

class GroupDetails extends StatelessWidget {
  const GroupDetails({super.key, required this.numberGroup});

  final String numberGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "المجموعة $numberGroup",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            customCard(title: 'المرحلة', width: 300.w, height: 60.h),
            customCard(title: 'رقم المجموعة', width: 300.w, height: 60.h),
            customCard(title: 'الترتيب الحالي', width: 300.w, height: 60.h),
            SizedBox(height: 20.h),
            Text(
              "الأكواد المتاحة",
              style: TextStyle(
                fontSize: 20.sp,
                color: BrandColors.primary,
              ),
            ),
            SizedBox(height: 20.h),
            const Text(
              'EG27L12158',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'EG27L12158',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'EG27L12158',
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ));
  }
}
