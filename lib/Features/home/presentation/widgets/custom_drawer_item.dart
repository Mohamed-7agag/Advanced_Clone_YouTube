import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem(
      {super.key, required this.icon, required this.text, this.onPressed});
  final Widget icon;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Row(
        children: [
          icon,
          SizedBox(width: 16.w),
          Text(text, style: Styles.textStyle16),
        ],
      ),
    );
  }
}
