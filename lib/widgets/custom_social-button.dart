import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsSocialIcon extends StatelessWidget {
  const ContactUsSocialIcon({
    super.key,
    required this.image,
    required this.link,
  });

  final String image;

  final String link;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch $link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(),
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: .5),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
            )),
      ),
    );
  }
}
