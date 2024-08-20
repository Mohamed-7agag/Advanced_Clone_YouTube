import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_property_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileProperties extends StatelessWidget {
  const ProfileProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePropertyItem(
          icon: Icons.settings_rounded,
          title: "Setting",
        ),
        SizedBox(height: 18.h),
        const ProfilePropertyItem(
          icon: Icons.bar_chart_rounded,
          title: "Time Watched",
        ),
        SizedBox(height: 18.h),
        const ProfilePropertyItem(
          icon: Icons.help_outline_rounded,
          title: "Help & Feedback",
        ),
        SizedBox(height: 18.h),
      ],
    );
  }
}
