import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileVideoItemTextSection extends StatelessWidget {
  const ProfileVideoItemTextSection({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${videoModel.snippet!.title}",
          maxLines: 1,
          style: Styles.textStyle12,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 3.h),
        Wrap(
          children: [
            videoModel.snippet!.channelTitle!.toString().length <= 20
                ? Text(
                    "${videoModel.snippet?.channelTitle} . ",
                    style: Styles.textStyle9.copyWith(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    "${videoModel.snippet?.channelTitle!.substring(0, 20)} . ",
                    style: Styles.textStyle11.copyWith(
                      color: Colors.grey[600],
                      fontSize: 8.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            Text(
              "${videoModel.snippet?.publishTime.toString().substring(0, 10)}",
              style: Styles.textStyle9.copyWith(color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
