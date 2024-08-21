import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/saved_videos_listview.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSavedVideos extends StatelessWidget {
  const ProfileSavedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).savedVideos,
          style: Styles.textStyle16,
        ),
        SizedBox(height: 12.h),
        const SavedVideosListView(),
      ],
    );
  }
}
