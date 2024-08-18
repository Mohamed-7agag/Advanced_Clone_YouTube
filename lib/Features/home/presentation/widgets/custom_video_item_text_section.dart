import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/more_vert_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVideoItemTextSection extends StatelessWidget {
  const CustomVideoItemTextSection({super.key, required this.videoModel, required this.channelDetailModel,});
  final VideoModel videoModel;
  final ChannelDetailModel channelDetailModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.channelDetailsViewRoute,
              arguments: channelDetailModel,
            );
          },
          child: CircleAvatar(
            radius: 21,
            backgroundColor: Colors.grey[200],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl:
                    "${channelDetailModel.snippet!.thumbnails!.thumbnailsDefault!.url}",
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
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${videoModel.snippet!.title}",
                maxLines: 2,
                style: Styles.textStyle13.copyWith(height: 1.4),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Wrap(
                children: [
                  Text(
                    "${videoModel.snippet?.channelTitle}  .  ",
                    style: Styles.textStyle11.copyWith(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${videoModel.snippet?.publishTime.toString().substring(0, 10)} . ",
                    style: Styles.textStyle11.copyWith(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            openMoreVertBottomSheet(context: context, videoModel: videoModel);
          },
          child: const Icon(
            Icons.more_vert,
          ),
        ),
      ],
    );
  }
}
