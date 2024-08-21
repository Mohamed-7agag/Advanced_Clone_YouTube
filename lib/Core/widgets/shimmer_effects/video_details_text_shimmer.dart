import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'video_item_text_shimmer_effect.dart';

class VideoDetailsTextShimmer extends StatelessWidget {
  const VideoDetailsTextShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VideoItemTextShimmerEffect(width: double.infinity, height: 18),
        SizedBox(height: 6.h),
        const VideoItemTextShimmerEffect(width: 290, height: 18),
        SizedBox(height: 10.h),
        Row(
          children: [
            const VideoItemTextShimmerEffect(width: 100, height: 25),
            SizedBox(width: 14.w),
            const VideoItemTextShimmerEffect(width: 80, height: 25),
          ],
        ),
      ],
    );
  }
}
