import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/my_groups_screen.dart';
import 'package:freelancer/screens/subscribe_group.dart';
import 'package:freelancer/widgets/custom_profile_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: customProfileBar(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ChooseCard(
              icon: Icons.group,
              text: 'مجموعاتي',
              onTap: () {
                MagicRouter.navigateTo(const MyGroupsScreen());
              },
            ),
            SizedBox(height: 15.h),
            ChooseCard(
              icon: Icons.group_add,
              text: 'الأشتراك في مجموعة جديدة',
              onTap: () {
                MagicRouter.navigateTo(const SubscribeGroup());
              },
            ),
            SizedBox(height: 20.h),
            Text("طلب تأسيس مجموعة جديدة",
                style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}

class ChooseCard extends StatelessWidget {
  const ChooseCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 300.w,
        height: 85.h,
        child: Card(
          elevation: 4,
          shadowColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: BrandColors.primary,
                ),
                Text(
                  text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
