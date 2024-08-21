import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';

import '../../data/models/channel_detail_model/channel_detail_model.dart';
import 'bottom_sheet_item.dart';

openMoreVertBottomSheet({
  required ctx,
  required VideoModel videoModel,
  required ChannelDetailModel channelDetailModel,
}) {
  showModalBottomSheet(
    context: ctx,
    builder: (context) {
      return Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, top: 15, end: 6, bottom: 15),
        height: 270,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<VideoInteractiveCubit, VideoInteractiveState>(
              builder: (context, state) {
                bool ok = context
                    .read<VideoInteractiveCubit>()
                    .isLiked(videoModel: videoModel);
                return BottomSheetItem(
                  onTap: () {
                    context.read<VideoInteractiveCubit>().interavtiveToggle(
                          videoModel: videoModel,
                          channelImage: channelDetailModel
                                  .snippet?.thumbnails?.medium?.url ??
                              '',
                        );
                  },
                  text: ok == true
                      ? S.of(context).removeLike
                      : S.of(context).like,
                  icon: Icon(
                    ok == true
                        ? Icons.thumb_up_alt_rounded
                        : Icons.thumb_up_alt_outlined,
                    color: Colors.black87,
                    size: 22,
                  ),
                );
              },
            ),
            BlocBuilder<SavedVideosCubit, SavedVideosState>(
              builder: (context, state) {
                bool ok = context
                    .read<SavedVideosCubit>()
                    .isSaved(videoModel: videoModel);
                return BottomSheetItem(
                  onTap: () {
                    context.read<SavedVideosCubit>().savedVideoToggle(
                          videoModel: videoModel,
                          channelImage: channelDetailModel
                                  .snippet?.thumbnails?.medium?.url ??
                              '',
                        );
                  },
                  text: ok == true
                      ? S.of(context).removeVideo
                      : S.of(context).save,
                  icon: Icon(
                    ok == true
                        ? Icons.library_add_check_rounded
                        : Icons.library_add_outlined,
                    color: Colors.black87,
                    size: 23,
                  ),
                );
              },
            ),
            BottomSheetItem(
              onTap: () {
                Share.share(videoModel.id?.videoId ?? '');
              },
              text: S.of(context).share,
              icon: const Icon(
                Icons.share,
                color: Colors.black87,
                size: 22,
              ),
            ),
            BottomSheetItem(
              text: S.of(context).download,
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.black87,
                size: 22,
              ),
            ),
          ],
        ),
      );
    },
  );
}
