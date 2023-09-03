import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/utils/brand_colors.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
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
                    "الاستفسارات",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => const FAQsItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQsItem extends StatelessWidget {
  const FAQsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text(
        'title',
        style: TextStyle(color: BrandColors.primary),
      ),
      children: <Widget>[
        ListTile(
          iconColor: BrandColors.primary,
          title: Text(
            ' descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc',
            style: TextStyle(color: BrandColors.primaryTwo),
          ),
        )
      ],
    );
  }
}
