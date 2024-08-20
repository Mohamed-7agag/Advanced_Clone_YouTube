import 'dart:convert';

import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';

import '../../data/models/video_statistics_model/video_statistics_model.dart';
import 'helper.dart';

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
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BlocBuilder<VideoInteractiveCubit,
                          VideoInteractiveState>(
                        builder: (context, state) {
                          bool ok = CacheHelper.getStringList(likedVideosKey)
                              .contains(json.encode(videoModel.toJson()));
                          return InkWell(
                            onTap: () {
                              if (state is VideoInteractiveLiked) {
                                context.read<VideoInteractiveCubit>().unLiked(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '');
                              } else {
                                context.read<VideoInteractiveCubit>().liked(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '');
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  ok == true
                                      ? Icons.thumb_up_alt_rounded
                                      : Icons.thumb_up_outlined,
                                  size: 21,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  refactNumber(videoStatisticsModel
                                      .statistics!.likeCount),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BlocBuilder<SavedVideosCubit, SavedVideosState>(
                        builder: (context, state) {
                          bool ok = CacheHelper.getStringList(savedVideosKey)
                              .contains(json.encode(videoModel.toJson()));
                          return InkWell(
                            onTap: () {
                              if (state is SavedVideosSaved) {
                                context.read<SavedVideosCubit>().unSaved(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '');
                              } else {
                                context.read<SavedVideosCubit>().saved(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '');
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  ok == true
                                      ? Icons.library_add_check_rounded
                                      : Icons.library_add_outlined,
                                  size: 21,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  ok == true ? "Saved" : "Save",
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {
                Share.share("YouTube Video");
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.share,
                    size: 19,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text("Share"),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.file_download_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 8.w,
                ),
                const Text("Download"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
