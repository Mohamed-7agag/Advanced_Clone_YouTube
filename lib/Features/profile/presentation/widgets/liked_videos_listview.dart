import 'dart:developer';

import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'custom_profile_video_item.dart';

class LikedVideosListView extends StatelessWidget {
  const LikedVideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VideoInteractiveCubit>(),
      child: BlocBuilder<VideoInteractiveCubit, VideoInteractiveState>(
        builder: (context, state) {
          List<dynamic> items =
              context.read<VideoInteractiveCubit>().getAllLikedVideos();
          log("liked videos length ${items[0].length}");
          log("liked images length ${items[1].length}");
          return SizedBox(
            height: 160.h,
            child: Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: items[0].length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
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
      ),
    );
  }
}
