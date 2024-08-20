import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/saved_videos_listview.dart';
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
          "Saved Videos",
          style: Styles.textStyle16,
        ),
        SizedBox(height: 12.h),
        const SavedVideosListView(),
      ],
    );
  }
}
