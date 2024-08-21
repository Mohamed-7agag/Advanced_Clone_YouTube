import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Core/widgets/shimmer_effects/channel_details_popular_videos_shimmer.dart';

import '../view_model/channel_videos_cubit/channel_videos_cubit.dart';
import 'channel_details_video_item.dart';

class ChannelDetailsListView extends StatelessWidget {
  const ChannelDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelVideosCubit, ChannelVideosState>(
      builder: (context, state) {
        if (state is ChannelVideosSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ListView.builder(
              itemCount: state.videos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ChannelDetailsVideoItem(
                    videoModel: state.videos[index],
                  ),
                );
              },
            ),
          );
        } else if (state is ChannelVideosFailure) {
          return const CustomErrorWidget();
        }
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ChannelDetailsPopularVideosShimmer(itemCount: 3),
        );
      },
    );
  }
}
