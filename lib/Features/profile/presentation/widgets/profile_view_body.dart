import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_liked_videos.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_saved_videos.dart';
import 'package:flutter/material.dart';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_properties.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const ProfileListTile(),
            Divider(
              color: kGrey300,
              thickness: 0.4,
              height: 26,
            ),
            const ProfileSavedVideos(),
            Divider(color: kGrey300, thickness: 0.4, height: 26),
            const ProfileLikedVideos(),
            Divider(color: kGrey300, thickness: 0.4, height: 26),
            const ProfileProperties(),
          ],
        ),
      ),
    );
  }
}
