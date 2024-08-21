import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/custom_video_item_text_section.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomVideoItem extends StatelessWidget {
  const CustomVideoItem({
    super.key,
    required this.videoModel,
    required this.channelDetailModel,
  });
  final VideoModel videoModel;
  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.videoDetailsViewRoute,
            arguments: videoModel);
      },
      child: Column(
        children: [
          Container(
            height: 225,
            width: double.infinity,
            color: Colors.grey[100],
            child: CachedNetworkImage(
              imageUrl: "${videoModel.snippet!.thumbnails!.medium!.url}",
              fit: BoxFit.fitWidth,
              errorWidget: (context, url, error) {
                return Icon(
                  Icons.error_outline_rounded,
                  size: 40,
                  color: Colors.grey[400],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12, vertical: 10),
            child: CustomVideoItemTextSection(
              videoModel: videoModel,
              channelDetailModel: channelDetailModel,
            ),
          ),
        ],
      ),
    );
  }
}
