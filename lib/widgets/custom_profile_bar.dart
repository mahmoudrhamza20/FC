import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/setting_screen.dart';

Widget customProfileBar() {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 180.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.right,
                  'مرحبا بك محمد',
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.w,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  '',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.w,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              MagicRouter.navigateTo(const SettingScreen());
            },
            child: SizedBox(
              width: 45.w,
              height: 45.w,
              child: Card(
                elevation: 4,
                shadowColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                        color: BrandColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
