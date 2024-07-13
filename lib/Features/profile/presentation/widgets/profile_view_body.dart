import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'liked_videos_listview.dart';
import 'saved_videos_listview.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage('assets/images/me.jpg'),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Hagag",
                      style: Styles.textStyle24,
                    ),
                    Text(
                      "mh169824@gmail.com",
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Divider(color: kGrey300, thickness: 0.4),
            SizedBox(height: 7.h),
            Text(
              "Liked Videos",
              style: Styles.textStyle18,
            ),
            SizedBox(height: 12.h),
            const LikedVideosListView(),
            Divider(color: kGrey300, thickness: 0.4),
            SizedBox(height: 7.h),
            Text(
              "Saved Videos",
              style: Styles.textStyle18,
            ),
            SizedBox(height: 12.h),
            const SavedVideosListView(),
            Divider(color: kGrey300, thickness: 0.4),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Icon(
                  Icons.settings_rounded,
                  size: 32,
                ),
                SizedBox(width: 16.w),
                Text(
                  "Setting",
                  style: Styles.textStyle18,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Icon(
                  Icons.bar_chart_rounded,
                  size: 32,
                ),
                SizedBox(width: 16.w),
                Text(
                  "Time Watched",
                  style: Styles.textStyle18,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Icon(
                  Icons.help_outline_rounded,
                  size: 32,
                ),
                SizedBox(width: 16.w),
                Text(
                  "Help & Feedback",
                  style: Styles.textStyle18,
                ),
              ],
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }
}
