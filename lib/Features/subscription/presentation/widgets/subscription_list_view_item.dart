import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/video_details/presentation/widgets/helper.dart';

import 'custom_popup_menu_button.dart';

class SubscriptionListViewItem extends StatelessWidget {
  const SubscriptionListViewItem({super.key, required this.channelDetailModel});
  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouter.channelDetailsViewRoute,
            arguments: channelDetailModel,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: "${channelDetailModel.snippet!.thumbnails!.medium!.url}",
            width: 50,
            height: 50,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return Icon(
                Icons.error_outline_rounded,
                size: 30,
                color: Colors.grey[400],
              );
            },
          ),
        ),
      ),
      title: Expanded(
        child: Text(
          "${channelDetailModel.snippet!.title}",
          style: Styles.textStyle16,
        ),
      ),
      subtitle: Expanded(
        child: Text(
          "${refactNumber(channelDetailModel.statistics!.subscriberCount)} Subscriber",
          style: Styles.textStyle12,
        ),
      ),
      trailing: CustomPopupMenuButton(channelDetailModel: channelDetailModel),
    );
  }
}

