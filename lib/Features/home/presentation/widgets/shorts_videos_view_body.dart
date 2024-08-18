import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Core/widgets/custom_loading_widget.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo_implement.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';

import 'custom_video_item.dart';

class ShortsVideosViewBody extends StatelessWidget {
  const ShortsVideosViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllVideosCubit(getIt.get<HomeRepoImplement>())
        ..getAllVideos(null, 'short'),
      child: BlocBuilder<AllVideosCubit, AllVideosState>(
        builder: (context, state) {
          if (state is AllVideosSuccess) {
            return ListView.builder(
              itemCount: state.videosWithChannelDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomVideoItem(
                      videoModel: state.videosWithChannelDetails[index]
                          ['video'],
                      channelDetailModel: state.videosWithChannelDetails[index]
                          ['channelDetails']),
                );
              },
            );
          } else if (state is AllVideosFailure) {
            return const CustomErrorWidget();
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
