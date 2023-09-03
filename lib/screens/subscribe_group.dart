import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/first_stage_screen.dart';
import 'package:freelancer/screens/second_stage_screen.dart';
import 'package:freelancer/widgets/custom_card.dart';

class SubscribeGroup extends StatelessWidget {
  const SubscribeGroup({super.key});

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
                      "المراحل المتاحة للمشترك",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "المرحلة السابقة",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: BrandColors.primary,
                  ),
                ),
                SizedBox(width: 30.w),
                InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const FirstStageScreen());
                    },
                    child: customCard(
                        title: 'الأولي', width: 120.w, height: 60.h)),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "المرحلة التالية",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: BrandColors.primary,
                  ),
                ),
                SizedBox(width: 45.w),
                InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const SecondStageScreen());
                    },
                    child: customCard(
                        title: 'الثانية', width: 120.w, height: 60.h)),
              ],
            ),
            SizedBox(height: 20.h),
          ]),
        ));
  }
}
