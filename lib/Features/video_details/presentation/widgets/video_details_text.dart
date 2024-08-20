import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:advanced_youtube/Core/utils/styles.dart';

import '../../../home/data/models/video_model/video_model.dart';
import '../../data/models/video_statistics_model/video_statistics_model.dart';
import 'helper.dart';

class VideoDetailsText extends StatelessWidget {
  const VideoDetailsText({super.key, required this.videoModel, required this.videoStatisticsModel});
  final VideoModel videoModel;
  final VideoStatisticsModel videoStatisticsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${videoModel.snippet!.title}",
          style: Styles.textStyle18,
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              "${refactNumber(videoStatisticsModel.statistics!.viewCount)} Views .",
              style: Styles.textStyle13,
            ),
            SizedBox(width: 10.w),
            Text(
              videoModel.snippet!.publishedAt.toString().substring(0, 10),
              style: Styles.textStyle13,
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "${videoModel.snippet!.description}",
          style: Styles.textStyle12.copyWith(color: Colors.grey.shade600),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
