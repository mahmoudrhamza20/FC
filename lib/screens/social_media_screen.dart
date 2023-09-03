import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/utils/app_assets.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/widgets/custom_social-button.dart';

class SocialMediacreen extends StatelessWidget {
  const SocialMediacreen({super.key});

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
                      "وسائل التواصل الاجتماعي",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContactUsSocialIcon(
                  image: AppAssets.face,
                  link: '',
                ),
                ContactUsSocialIcon(
                  image: AppAssets.insta2,
                  link: '',
                ),
                ContactUsSocialIcon(
                  image: AppAssets.tiktok,
                  link: '',
                ),
                ContactUsSocialIcon(
                  image: AppAssets.youtube,
                  link: '',
                ),
                ContactUsSocialIcon(
                  image: AppAssets.snap,
                  link: '',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
