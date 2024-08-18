import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/video_model/video_model.dart';
import '../view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'custom_profile_video_item.dart';

class SavedVideosListView extends StatelessWidget {
  const SavedVideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedVideosCubit, SavedVideosState>(
      builder: (context, state) {
        List<VideoModel> items =
            context.read<SavedVideosCubit>().getsavedVideos();
        return SizedBox(
          height: 230.h,
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomProfileVideoItem(
                      videoModel: items[items.length-index-1],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
