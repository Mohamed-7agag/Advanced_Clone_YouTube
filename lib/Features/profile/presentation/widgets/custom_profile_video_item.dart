import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_video_item_text_section.dart';

class CustomProfileVideoItem extends StatelessWidget {
  const CustomProfileVideoItem(
      {super.key, required this.videoModel, required this.channelImage});
  final VideoModel videoModel;
  final String channelImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.videoDetailsViewRoute,
          arguments: videoModel,
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 95,
              color: Colors.grey[200],
              child: CachedNetworkImage(
                imageUrl: "${videoModel.snippet!.thumbnails!.medium!.url}",
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.grey[200],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: channelImage,
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
                SizedBox(width: 8.w),
                Expanded(
                  child: ProfileVideoItemTextSection(videoModel: videoModel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
