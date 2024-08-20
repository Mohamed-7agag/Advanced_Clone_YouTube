import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Core/widgets/custom_button.dart';
import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Core/utils/app_router.dart';
import '../../../home/data/models/video_model/video_model.dart';
import '../../../subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';
import '../../data/models/video_statistics_model/video_statistics_model.dart';
import 'helper.dart';
import 'video_details_action_shimmer.dart';

class VideoActionAndComments extends StatelessWidget {
  const VideoActionAndComments({
    super.key,
    required this.videoStatisticsModel,
    required this.videoModel,
  });

  final VideoStatisticsModel videoStatisticsModel;
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ChannelDetailsCubit, ChannelDetailsState>(
          builder: (context, state) {
            if (state is ChannelDetailsSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
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
                                  size: 40,
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
                            "${refactNumber(state.channelDetails.statistics!.subscriberCount)} Subscriber",
                            style: Styles.textStyle11,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<SubscriptionCubit, SubscriptionState>(
                    builder: (context, subscriptionState) {
                      // bool isSubscribed = context
                      //     .read<SubscriptionsCubit>()
                      //     .getSubscribedChannels()
                      //     .any((channel) =>
                      //         channel.id == state.channelDetails.id);
                      bool isSubscribed = false;
                      return CustomButton(
                        text: isSubscribed ? "Subscribed" : "Subscribe",
                        backgroundColor:
                            isSubscribed ? Colors.grey[200]! : Colors.black,
                        foregroundColor:
                            isSubscribed ? Colors.black : Colors.white,
                        icon: isSubscribed
                            ? const Icon(
                                Icons.done_rounded,
                                size: 23,
                                color: Colors.green,
                              )
                            : const Text(""),
                        onPressed: () {
                          if (isSubscribed) {
                            context
                                .read<SubscriptionCubit>()
                                .toggleSubscription(
                                  channelDetailModel: state.channelDetails,
                                );
                          } else {
                            context
                                .read<SubscriptionCubit>()
                                .toggleSubscription(
                                  channelDetailModel: state.channelDetails,
                                );
                          }
                        },
                      );
                    },
                  ),
                ],
              );
            } else if (state is ChannelDetailsFailure) {
              return const CustomErrorWidget();
            }
            return Shimmer.fromColors(
              baseColor: kGrey100,
              highlightColor: kGrey300,
              child: const VideoDetailsActionShimmer(),
            );
          },
        ),
        SizedBox(height: 15.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Comments  ${videoStatisticsModel.statistics!.commentCount ?? 0}",
                style: Styles.textStyle14,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[300],
                      ),
                      child: Text(
                        "Add a comment",
                        style: Styles.textStyle12,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
