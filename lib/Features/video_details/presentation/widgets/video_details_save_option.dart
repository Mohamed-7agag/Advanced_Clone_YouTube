import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/video_model/video_model.dart';
import '../../../profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';

class VideoDetailsSaveOption extends StatelessWidget {
  const VideoDetailsSaveOption(
      {super.key, required this.videoModel, required this.channelImage});

  final VideoModel videoModel;
  final String channelImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocProvider(
        create: (context) => getIt<SavedVideosCubit>(),
        child: BlocBuilder<SavedVideosCubit, SavedVideosState>(
          builder: (context, state) {
            bool ok = context
                .read<SavedVideosCubit>()
                .isSaved(videoModel: videoModel);
            return GestureDetector(
              onTap: () {
                context.read<SavedVideosCubit>().savedVideoToggle(
                      videoModel: videoModel,
                      channelImage: channelImage,
                    );
              },
              child: Row(
                children: [
                  Icon(
                    ok == true
                        ? Icons.library_add_check_rounded
                        : Icons.library_add_outlined,
                    size: 21,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    ok == true ? S.of(context).remove : S.of(context).save,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
