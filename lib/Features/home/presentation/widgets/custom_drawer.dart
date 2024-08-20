import 'package:advanced_youtube/Core/widgets/custom_url_launcher.dart';
import 'package:advanced_youtube/Features/home/presentation/widgets/custom_drawer_item.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 50, start: 14, end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/ytlogo.png",
                  width: 110,
                ),
                SizedBox(height: 40.h),
                CustomDrawerItem(
                  icon: const Icon(
                    Icons.whatshot_outlined,
                    size: 28,
                  ),
                  text: S.of(context).trending,
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  icon: const Icon(
                    Icons.music_note_outlined,
                    size: 28,
                  ),
                  text: S.of(context).music,
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  icon: const Icon(
                    Icons.podcasts_rounded,
                    size: 28,
                  ),
                  text: S.of(context).live,
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  icon: const Icon(
                    Icons.sports_esports_outlined,
                    size: 28,
                  ),
                  text: S.of(context).gaming,
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  icon: const Icon(
                    Icons.emoji_events_outlined,
                    size: 28,
                  ),
                  text: S.of(context).sports,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
            height: 60,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(bottom: 12, start: 14, end: 5),
            child: Column(
              children: [
                CustomDrawerItem(
                  onPressed: () {
                    customUrlLauncher(
                        context, "https://www.youtube.com/premium/");
                  },
                  icon: SvgPicture.asset(
                    'assets/images/youtube.svg',
                    width: 35,
                    fit: BoxFit.fill,
                  ),
                  text: "YouTube Premium",
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  onPressed: () {
                    customUrlLauncher(context, "https://studio.youtube.com/");
                  },
                  icon: SvgPicture.asset(
                    'assets/images/studio.svg',
                    width: 35,
                    fit: BoxFit.fill,
                  ),
                  text: "YouTube Studio",
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  onPressed: () {
                    customUrlLauncher(context, "https://music.youtube.com/");
                  },
                  icon: SvgPicture.asset(
                    'assets/images/music.svg',
                    width: 35,
                    fit: BoxFit.fill,
                  ),
                  text: "YouTube Music",
                ),
                SizedBox(height: 25.h),
                CustomDrawerItem(
                  onPressed: () {
                    customUrlLauncher(context, "https://www.youtubekids.com/");
                  },
                  icon: Image.asset(
                    'assets/images/youtube_kids.png',
                    width: 33,
                    fit: BoxFit.fill,
                  ),
                  text: "YouTube Kids",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
