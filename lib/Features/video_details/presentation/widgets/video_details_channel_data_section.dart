import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:advanced_youtube/Core/helper/refactor_number_function.dart';
import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Core/widgets/shimmer_effects/video_details_action_shimmer.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'video_details_subscription_button.dart';

class VideoDetailsChannelDataSection extends StatelessWidget {
  const VideoDetailsChannelDataSection(
      {super.key, required this.videoModel, required this.controller});
  final VideoModel videoModel;
  final YoutubePlayerController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelDetailsCubit, ChannelDetailsState>(
      builder: (context, state) {
        if (state is ChannelDetailsSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.pause();
                      Navigator.pushNamed(
                        context,
                        AppRouter.channelDetailsViewRoute,
                        arguments: state.channelDetails,
                      );
                    },
                    child: CircleAvatar(
                      radius: 22,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${state.channelDetails.snippet!.thumbnails!.thumbnailsDefault!.url}",
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) {
                            return Icon(
                              Icons.error_outline_rounded,
                              size: 30,
                              color: Colors.grey[300],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoModel.snippet!.channelTitle!.length <= 25
                            ? "${videoModel.snippet!.channelTitle}"
                            : videoModel.snippet!.channelTitle
                                .toString()
                                .substring(0, 25),
                        style: Styles.textStyle15,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${refactNumber(state.channelDetails.statistics!.subscriberCount)} ${S.of(context).subscriber}",
                        style: Styles.textStyle11,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              VideoDetailsSubscriptionButton(
                channelDetailModel: state.channelDetails,
              ),
            ],
          );
        } else if (state is ChannelDetailsFailure) {
          return const CustomErrorWidget();
        }
        return const VideoDetailsActionShimmer();
      },
    );
  }
}
