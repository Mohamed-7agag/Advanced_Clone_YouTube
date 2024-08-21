import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItemTextShimmerEffect extends StatelessWidget {
  const VideoItemTextShimmerEffect(
      {super.key, required this.width, required this.height});
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
