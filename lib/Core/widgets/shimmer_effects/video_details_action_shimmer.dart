import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'video_item_text_shimmer_effect.dart';

class VideoDetailsActionShimmer extends StatelessWidget {
  const VideoDetailsActionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kGrey100,
      highlightColor: kGrey300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const VideoItemTextShimmerEffect(width: 40, height: 40),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VideoItemTextShimmerEffect(width: 120, height: 10),
                  SizedBox(height: 5.h),
                  const VideoItemTextShimmerEffect(width: 80, height: 10),
                ],
              ),
            ],
          ),
          const VideoItemTextShimmerEffect(width: 90, height: 30),
        ],
      ),
    );
  }
}
