import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:advanced_youtube/Core/helper/refactor_number_function.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';

import '../../../profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';
import '../../data/models/video_statistics_model/video_statistics_model.dart';

class VideoDetailsLikesOption extends StatelessWidget {
  const VideoDetailsLikesOption({
    super.key,
    required this.videoModel,
    required this.videoStatisticsModel,
    required this.channelImage,
  });

  final VideoModel videoModel;
  final VideoStatisticsModel videoStatisticsModel;
  final String channelImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<VideoInteractiveCubit>().interavtiveToggle(
              videoModel: videoModel,
              channelImage: channelImage,
            );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(50),
        ),
        child: BlocBuilder<VideoInteractiveCubit, VideoInteractiveState>(
          builder: (context, state) {
            bool ok = context
                .read<VideoInteractiveCubit>()
                .isLiked(videoModel: videoModel);
            return Row(
              children: [
                Icon(
                  ok == true
                      ? Icons.thumb_up_alt_rounded
                      : Icons.thumb_up_outlined,
                  size: 21,
                ),
                SizedBox(width: 8.w),
                Text(
                  refactNumber(
                    videoStatisticsModel.statistics!.likeCount,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
