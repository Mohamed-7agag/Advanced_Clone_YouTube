import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'more_vert_bottom_sheet.dart';

class HomeListViewItem extends StatefulWidget {
  const HomeListViewItem({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  State<HomeListViewItem> createState() => _HomeListViewItemState();
}

class _HomeListViewItemState extends State<HomeListViewItem> {
  @override
  void initState() {
    BlocProvider.of<ChannelDetailsCubit>(context).getChannelDetails(
      channelId: widget.videoModel.snippet!.channelId!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.videoDetailsViewRoute,
            arguments: widget.videoModel);
      },
      child: Column(
        children: [
          Container(
            height: 225,
            width: double.infinity,
            color: Colors.grey[100],
            child: CachedNetworkImage(
              imageUrl: "${widget.videoModel.snippet!.thumbnails!.medium!.url}",
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ChannelDetailsCubit, ChannelDetailsState>(
                  builder: (context, state) {
                    if (state is ChannelDetailsSuccess) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRouter.channelDetailsViewRoute,
                            arguments: state.channelDetails[0],
                          );
                        },
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: Colors.grey[200],
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${state.channelDetails[0].snippet!.thumbnails!.thumbnailsDefault!.url}",
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
                      );
                    } else if (state is ChannelDetailsFailure) {
                      return const Icon(Icons.error);
                    }
                    return CircleAvatar(radius: 21, backgroundColor: kGrey300);
                  },
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.videoModel.snippet!.title}",
                        maxLines: 2,
                        style: Styles.textStyle13.copyWith(height: 1.4),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "${widget.videoModel.snippet?.channelTitle}  .  ",
                            style: Styles.textStyle11.copyWith(
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${widget.videoModel.snippet?.publishTime.toString().substring(0, 10)} . ",
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
                    openMoreVertBottomSheet(context: context, videoModel: widget.videoModel);
                  },
                  child: const Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
