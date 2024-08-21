import 'package:advanced_youtube/Core/widgets/shimmer_effects/video_item_text_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants.dart';

class VideoItemShimmerEffect extends StatelessWidget {
  const VideoItemShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 30),
      child: Shimmer.fromColors(
        baseColor: kGrey100,
        highlightColor: kGrey300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VideoItemTextShimmerEffect(width: 50, height: 50),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VideoItemTextShimmerEffect(width: 300, height: 12),
                      SizedBox(height: 5.h),
                      const VideoItemTextShimmerEffect(width: 240, height: 12),
                      SizedBox(height: 7.h),
                      const VideoItemTextShimmerEffect(width: 170, height: 12),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
