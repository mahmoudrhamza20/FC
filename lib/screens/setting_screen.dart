import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';

import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/faqs_screen.dart';
import 'package:freelancer/screens/social_media_screen.dart';

import 'package:freelancer/widgets/profile_menu.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // late String dropdownvalue;

  // final List<Widget> items = [
  //   const ContactUsSocialIcon(
  //     image: AppAssets.face,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.insta2,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.tiktok,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.youtube,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.snap,
  //     link: '',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "الأعدادات",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            ProfileMenu(
              text: "تغير اللغة",
              press: () => {},
            ),
            ProfileMenu(
              text: "تغير كلمة السر",
              press: () {},
            ),
            ProfileMenu(
              text: "خدمة العملاء والدعم الفني",
              press: () {},
            ),
            ProfileMenu(
              text: "وسائل التواصل الاجتماعي",
              press: () => MagicRouter.navigateTo(const SocialMediacreen()),
              // press: () {
              //   PopupMenuButton<String>(
              //     itemBuilder: (BuildContext context) {
              //       return items
              //           .map(
              //             (Widget value) => PopupMenuItem<String>(
              //               child: value,
              //             ),
              //           )
              //           .toList();
              //     },
              //   );
              // },
            ),
            ProfileMenu(
              text: "الاستفسارات",
              press: () => MagicRouter.navigateTo(const FAQsScreen()),
            ),
            ProfileMenu(
              text: "تسجيل الخروج",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
