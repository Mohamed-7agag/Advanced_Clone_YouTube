import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelDetailsVideoItem extends StatelessWidget {
  const ChannelDetailsVideoItem({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.videoDetailsViewRoute,arguments: videoModel);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 88.h,
              width: 155.w,
              color: Colors.grey[100],
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
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Text(
                  "${videoModel.snippet!.title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(videoModel.snippet!.publishedAt!.substring(0, 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
