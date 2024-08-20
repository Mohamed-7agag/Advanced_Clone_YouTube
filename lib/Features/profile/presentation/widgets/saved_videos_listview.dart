import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'custom_profile_video_item.dart';

class SavedVideosListView extends StatelessWidget {
  const SavedVideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedVideosCubit, SavedVideosState>(
      builder: (context, state) {
        List<dynamic> items =
            context.read<SavedVideosCubit>().getAllsavedVideos();
        return SizedBox(
          height: 160.h,
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items[0].length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomProfileVideoItem(
                      videoModel: items[0][items[0].length - index - 1],
                      channelImage: items[1][items[1].length - index - 1],
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
