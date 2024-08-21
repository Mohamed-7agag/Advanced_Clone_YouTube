import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../home/data/models/video_model/video_model.dart';
import '../../data/models/video_statistics_model/video_statistics_model.dart';
import 'video_details_channel_data_section.dart';
import 'video_details_comment_section.dart';

class VideoActionAndComments extends StatelessWidget {
  const VideoActionAndComments({
    super.key,
    required this.videoStatisticsModel,
    required this.videoModel, required this.controller,
  });

  final VideoStatisticsModel videoStatisticsModel;
  final VideoModel videoModel;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoDetailsChannelDataSection(videoModel: videoModel, controller: controller),
        SizedBox(height: 25.h),
        VideoDetailsCommentsSection(videoStatisticsModel: videoStatisticsModel),
      ],
    );
  }
}
