import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'video_item_text_shimmer_effect.dart';

class ChannelDetailsPopularVideosShimmer extends StatelessWidget {
  const ChannelDetailsPopularVideosShimmer(
      {super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Shimmer.fromColors(
            baseColor: kGrey100,
            highlightColor: kGrey300,
            child: Row(
              children: [
                Container(
                  height: 88.h,
                  width: 155.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VideoItemTextShimmerEffect(width: 170, height: 13),
                    SizedBox(height: 5.h),
                    const VideoItemTextShimmerEffect(width: 140, height: 12),
                    SizedBox(height: 5.h),
                    const VideoItemTextShimmerEffect(width: 110, height: 12),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
