import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/saved_videos_listview.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileLikedVideos extends StatelessWidget {
  const ProfileLikedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).likedVideos,
          style: Styles.textStyle16,
        ),
        SizedBox(height: 12.h),
        const SavedVideosListView(),
      ],
    );
  }
}
