import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';

import '../../data/models/video_statistics_model/video_statistics_model.dart';
import 'video_details_download_option.dart';
import 'video_details_like_option.dart';
import 'video_details_save_option.dart';
import 'video_details_share_option.dart';

class VideoDetailsInteractive extends StatelessWidget {
  const VideoDetailsInteractive({
    super.key,
    required this.videoStatisticsModel,
    required this.videoModel,
  });
  final VideoStatisticsModel videoStatisticsModel;
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BlocBuilder<ChannelDetailsCubit, ChannelDetailsState>(
            builder: (context, channelState) {
              if (channelState is ChannelDetailsSuccess) {
                return Row(
                  children: [
                    VideoDetailsLikesOption(
                      videoModel: videoModel,
                      videoStatisticsModel: videoStatisticsModel,
                      channelImage: channelState.channelDetails.snippet
                              ?.thumbnails?.medium?.url ??
                          '',
                    ),
                    SizedBox(width: 10.w),
                    VideoDetailsSaveOption(
                      videoModel: videoModel,
                      channelImage: channelState.channelDetails.snippet
                              ?.thumbnails?.medium?.url ??
                          '',
                    ),
                  ],
                );
              } else if (channelState is ChannelDetailsFailure) {
                return const CustomErrorWidget();
              }
              return const CircularProgressIndicator();
            },
          ),
          SizedBox(width: 10.w),
          VideoDetailsShareOption(videoModel: videoModel),
          SizedBox(width: 10.w),
          const VideoDetailsDownloadOption(),
        ],
      ),
    );
  }
}
