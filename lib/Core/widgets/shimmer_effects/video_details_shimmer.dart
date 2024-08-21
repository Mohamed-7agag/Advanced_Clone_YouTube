import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'video_item_text_shimmer_effect.dart';
import 'video_details_action_shimmer.dart';
import 'video_details_text_shimmer.dart';

class VideoDetailsShimmerEffect extends StatelessWidget {
  const VideoDetailsShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kGrey100,
      highlightColor: kGrey300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VideoDetailsTextShimmer(),
                SizedBox(height: 25.h),
                const VideoDetailsActionShimmer(),
                SizedBox(height: 25.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: VideoItemTextShimmerEffect(width: 60, height: 30),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: VideoItemTextShimmerEffect(width: 60, height: 30),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: VideoItemTextShimmerEffect(width: 60, height: 30),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: VideoItemTextShimmerEffect(width: 60, height: 30),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Container(
                  height: 85.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
