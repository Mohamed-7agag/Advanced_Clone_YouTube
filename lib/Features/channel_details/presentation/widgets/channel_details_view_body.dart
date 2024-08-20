import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Core/widgets/custom_button.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/video_details/presentation/widgets/helper.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';
import 'channel_details_listview.dart';

class ChannelDetailsViewBody extends StatelessWidget {
  const ChannelDetailsViewBody({super.key, required this.channelDetailModel});
  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl:
                  "${channelDetailModel.snippet!.thumbnails!.medium!.url}",
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Icon(
                  Icons.error_outline_rounded,
                  size: 40,
                  color: Colors.grey[400],
                );
              },
            ),
          ),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      "${channelDetailModel.snippet!.thumbnails!.medium!.url}",
                  width: 75.w,
                  height: 75.h,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.error_outline_rounded,
                      size: 40,
                      color: Colors.grey[400],
                    );
                  },
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  channelDetailModel.snippet!.title!.length <= 25
                      ? Text(
                          "${channelDetailModel.snippet!.title}",
                          style: Styles.textStyle20,
                        )
                      : Text(
                          channelDetailModel.snippet!.title!
                              .substring(0, 25),
                          style: Styles.textStyle20,
                        ),
                  Text(
                    "${channelDetailModel.snippet!.customUrl}",
                    style: Styles.textStyle13,
                  ),
                  Row(
                    children: [
                      Text(
                        "${refactNumber(channelDetailModel.statistics!.subscriberCount)} ${S.of(context).subscriber}  .  ",
                        style: Styles.textStyle13,
                      ),
                      Text(
                        "${refactNumber(channelDetailModel.statistics!.videoCount)} Video",
                        style: Styles.textStyle13,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Text(
            "${channelDetailModel.snippet!.description}",
            style: Styles.textStyle14,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 25.h),
          BlocBuilder<SubscriptionCubit, SubscriptionState>(
            builder: (context, state) {
              bool ok = context.read<SubscriptionCubit>().isSubscribed(channelDetailModel);
              return CustomButton(
                text: ok == true ? S.of(context).subscribed : S.of(context).subscribe,
                backgroundColor: ok == true ? Colors.grey[300]! : Colors.black,
                foregroundColor: ok == true ? Colors.black : Colors.white,
                icon: ok == true
                    ? const Icon(
                        Icons.done_rounded,
                        size: 23,
                        color: Colors.green,
                      )
                    : const Text(""),
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  context.read<SubscriptionCubit>().toggleSubscription(
                    channelDetailModel: channelDetailModel,
                  );
                  
                },
              );
            },
          ),
          SizedBox(height: 20.h),
          Text(
            S.of(context).popularVideos,
            style: Styles.textStyle18,
          ),
          SizedBox(height: 12.h),
          const Expanded(
            child: ChannelDetailsListView(),
          ),
        ],
      ),
    );
  }
}
