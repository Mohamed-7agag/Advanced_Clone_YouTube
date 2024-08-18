import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/video_details/presentation/widgets/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/subscription_cubit/subscriptions_cubit.dart';

class SubscriptionListViewItem extends StatelessWidget {
  const SubscriptionListViewItem({super.key, required this.channelDetailModel});
  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.channelDetailsViewRoute,
                  arguments: channelDetailModel,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CachedNetworkImage(
                  imageUrl:
                      "${channelDetailModel.snippet!.thumbnails!.medium!.url}",
                  width: 56,
                  height: 56,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.error_outline_rounded,
                      size: 35,
                      color: Colors.grey[400],
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                channelDetailModel.snippet!.title!.length <= 20
                    ? Text(
                        "${channelDetailModel.snippet!.title}",
                        style: Styles.textStyle18,
                      )
                    : Text(
                        channelDetailModel.snippet!.title!.substring(0, 20),
                        style: Styles.textStyle18,
                      ),
                Text(
                  "${refactNumber(channelDetailModel.statistics!.subscriberCount)} Subscriber",
                  style: Styles.textStyle12,
                ),
              ],
            )
          ],
        ),
        PopupMenuButton(
          iconSize: 26,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          offset: const Offset(-25, 25),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: "View Channel",
              height: 20,
              padding: const EdgeInsets.only(bottom: 16, left: 14, right: 14),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.channelDetailsViewRoute,
                  arguments: channelDetailModel,
                );
              },
              child: const Text("View Channel"),
            ),
            PopupMenuItem(
              value: "unsubscribe",
              height: 12,
              padding: const EdgeInsets.only(bottom: 6, left: 10, right: 10),
              onTap: () {
                context.read<SubscriptionsCubit>().unSubscribed(
                      channelDetailModel: channelDetailModel,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text("Subscription has been cancelled"),
                  ),
                );
              },
              child: const Text(
                "Unsubscribe",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
