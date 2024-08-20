import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';

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
                          bool ok = context
                              .read<VideoInteractiveCubit>()
                              .isLiked(videoModel: videoModel);
                          return InkWell(
                            onTap: () {
                              context
                                  .read<VideoInteractiveCubit>()
                                  .interavtiveToggle(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '',
                                  );
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
                          bool ok = context
                              .read<SavedVideosCubit>()
                              .isSaved(videoModel: videoModel);
                          return InkWell(
                            onTap: () {
                              context.read<SavedVideosCubit>().savedVideoToggle(
                                    videoModel: videoModel,
                                    channelImage: channelState.channelDetails
                                            .snippet?.thumbnails?.medium?.url ??
                                        '',
                                  );
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
                                  ok == true ? S.of(context).remove : S.of(context).save,
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
                Share.share(videoModel.id?.videoId ?? '');
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
                  Text(S.of(context).share),
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
                Text(S.of(context).download),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
