import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'bottom_sheet_item.dart';

openMoreVertBottomSheet({required context, required VideoModel videoModel}) {
  showModalBottomSheet(
    builder: (context) {
      
      return Container(
        padding: const EdgeInsets.only(left: 12, top: 15, right: 6, bottom: 15),
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
                bool ok = CacheHelper.getStringList(key: likedVideosKey)
                    .contains(json.encode(videoModel.toJson()));
                return BottomSheetItem(
                  onTap: () {
                    if (state is VideoInteractiveLiked) {
                      context.read<VideoInteractiveCubit>().unLiked(
                            videoModel: videoModel,
                          );
                    } else {
                      context.read<VideoInteractiveCubit>().liked(
                            videoModel: videoModel,
                          );
                    }
                  },
                  text: ok == true ? "Remove Like" : "Add Like",
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
                bool ok = CacheHelper.getStringList(key: savedVideosKey)
                    .contains(json.encode(videoModel.toJson()));
                return BottomSheetItem(
                  onTap: () {
                    if (state is SavedVideosSaved) {
                      context.read<SavedVideosCubit>().unSaved(
                            videoModel: videoModel,
                          );
                    } else {
                      context.read<SavedVideosCubit>().saved(
                            videoModel: videoModel,
                          );
                    }
                  },
                  text: ok == true ? "Remove from saved videos" : "Save Video",
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
                Share.share("YouTube Video");
              },
              text: "Share Video",
              icon: const Icon(
                Icons.share,
                color: Colors.black87,
                size: 22,
              ),
            ),
            const BottomSheetItem(
              text: "Download Video",
              icon: Icon(
                Icons.file_download_outlined,
                color: Colors.black87,
                size: 22,
              ),
            ),
          ],
        ),
      );
    },
    context: context,
  );
}
