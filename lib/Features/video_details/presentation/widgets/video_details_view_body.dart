import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';

import '../../../../Core/widgets/shimmer_effects/video_details_shimmer.dart';
import '../../../home/data/models/video_model/video_model.dart';
import '../view_model/video_details_cubit/video_statistics_cubit.dart';
import 'video_actions_and_comments.dart';
import 'video_details_interactive.dart';
import 'video_details_text.dart';

class VideoDetailsViewBody extends StatefulWidget {
  const VideoDetailsViewBody({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  State<VideoDetailsViewBody> createState() => _VideoDetailsViewBodyState();
}

class _VideoDetailsViewBodyState extends State<VideoDetailsViewBody> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.videoModel.id?.videoId ?? '',
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            key: UniqueKey(),
          ),
          BlocBuilder<VideoStatisticsCubit, VideoStatisticsState>(
            builder: (context, state) {
              if (state is VideoStatisticsSuccess) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 14, end: 14, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoDetailsText(
                        videoModel: widget.videoModel,
                        videoStatisticsModel: state.videoStatistics[0],
                      ),
                      SizedBox(height: 30.h),
                      VideoDetailsInteractive(
                        videoModel: widget.videoModel,
                        videoStatisticsModel: state.videoStatistics[0],
                      ),
                      SizedBox(height: 25.h),
                      VideoActionAndComments(
                        videoModel: widget.videoModel,
                        videoStatisticsModel: state.videoStatistics[0],
                        controller: controller,
                      ),
                    ],
                  ),
                );
              } else if (state is VideoStatisticsFailure) {
                return const CustomErrorWidget();
              }
              return const VideoDetailsShimmerEffect();
            },
          )
        ],
      ),
    );
  }
}
