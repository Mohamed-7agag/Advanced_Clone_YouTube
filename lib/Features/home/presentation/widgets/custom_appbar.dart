import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_tabs_appbar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: BottomTabsAppBar(),
      ),
      floating: true,
      snap: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      leadingWidth: 110,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 14),
        child: Image.asset(
          "assets/images/ytlogo.png",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
          ),
        ),
        SizedBox(width: 8.w),
        const Icon(
          Icons.notifications_none_outlined,
          size: 26,
        ),
        SizedBox(width: 8.w),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.searchViewRoute);
          },
          icon: const Icon(
            CupertinoIcons.search,
            size: 25,
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}
