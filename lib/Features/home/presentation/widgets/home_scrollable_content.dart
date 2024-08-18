import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Core/widgets/shimmer_effect.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/custom_appbar.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/custom_video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrollableContent extends StatelessWidget {
  const HomeScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [const CustomAppBar()];
      },
      body: BlocBuilder<AllVideosCubit, AllVideosState>(
        builder: (context, state) {
          if (state is AllVideosSuccess) {
            return ListView.builder(
              itemCount: state.videosWithChannelDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomVideoItem(
                    videoModel: state.videosWithChannelDetails[index]['video'],
                    channelDetailModel: state.videosWithChannelDetails[index]
                        ['channelDetails'],
                  ),
                );
              },
            );
          } else if (state is AllVideosFailure) {
            return const CustomErrorWidget();
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return const ShimmerEffect();
            },
          );
        },
      ),
    );
  }
}
