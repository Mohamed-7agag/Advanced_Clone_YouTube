import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/video_model/video_model.dart';
import '../view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'custom_profile_video_item.dart';

class LikedVideosListView extends StatelessWidget {
  const LikedVideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoInteractiveCubit, VideoInteractiveState>(
      builder: (context, state) {
        List<VideoModel> items =
            context.read<VideoInteractiveCubit>().getLikedVideos();
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
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      child: CustomProfileVideoItem(
                        videoModel: items[items.length - index - 1],
                      ),
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
