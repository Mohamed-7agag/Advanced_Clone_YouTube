import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/generated/l10n.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${videoStatisticsModel.statistics!.commentCount ?? 0}",
                style: Styles.textStyle12,
              ),
              SizedBox(width: 5.w),
              Text(
                S.of(context).comment,
                style: Styles.textStyle12,
              ),
            ],
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
                  
                  padding: const EdgeInsetsDirectional.only(start: 10,top: 2,bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300],
                  ),
                  child: Text(
                    S.of(context).addComment,
                    style: Styles.textStyle11,
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
