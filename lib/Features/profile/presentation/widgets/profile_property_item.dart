import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePropertyItem extends StatelessWidget {
  const ProfilePropertyItem(
      {super.key, required this.title, required this.icon, this.ontTap});
  final String title;
  final IconData icon;
  final VoidCallback? ontTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: Styles.textStyle15,
          ),
        ],
      ),
    );
  }
}
