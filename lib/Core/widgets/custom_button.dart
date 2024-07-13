import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      required this.onPressed,
      required this.backgroundColor,
      required this.foregroundColor,
      this.icon});
  final String text;
  final double? width;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        fixedSize: width != null ? Size.fromWidth(width!) : null,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
          ),
          SizedBox(width: 5.w),
          icon ?? const Text(""),
        ],
      ),
    );
  }
}
