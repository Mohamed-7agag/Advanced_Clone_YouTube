import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/video_details_cubit/video_statistics_cubit.dart';
import '../widgets/video_details_view_body.dart';

class VideoDetailsView extends StatefulWidget {
  const VideoDetailsView({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  State<VideoDetailsView> createState() => _VideoDetailsViewState();
}

class _VideoDetailsViewState extends State<VideoDetailsView> {
  @override
  void initState() {
    BlocProvider.of<VideoStatisticsCubit>(context).getVideoStatistics(
      videoId: widget.videoModel.id!.videoId!,
    );
    BlocProvider.of<ChannelDetailsCubit>(context).getChannelDetails(
      channelId: widget.videoModel.snippet!.channelId!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VideoDetailsViewBody(
          videoModel: widget.videoModel,
        ),
      ),
    );
  }
}
