import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              "${refactNumber(videoStatisticsModel.statistics!.viewCount)} Views",
              style: Styles.textStyle14,
            ),
            SizedBox(width: 18.w),
            Text(
              videoModel.snippet!.publishedAt.toString().substring(0, 10),
              style: Styles.textStyle14,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "${videoModel.snippet!.description}",
          style: Styles.textStyle14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
