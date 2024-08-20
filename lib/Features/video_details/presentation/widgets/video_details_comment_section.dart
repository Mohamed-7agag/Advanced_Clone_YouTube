import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/video_statistics_model/video_statistics_model.dart';

class VideoDetailsCommentsSection extends StatelessWidget {
  const VideoDetailsCommentsSection(
      {super.key, required this.videoStatisticsModel});

  final VideoStatisticsModel videoStatisticsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comments  ${videoStatisticsModel.statistics!.commentCount ?? 0}",
            style: Styles.textStyle14,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Colors.grey[300],
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300],
                  ),
                  child: Text(
                    "Add a comment",
                    style: Styles.textStyle12,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
