import 'package:advanced_youtube/Features/profile/presentation/widgets/profile_property_item.dart';
import 'package:advanced_youtube/Features/bottom_navigation_bar/bottom_appbar_cubit.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProfileProperties extends StatelessWidget {
  const ProfileProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePropertyItem(
          icon: Icons.language_rounded,
          title: S.of(context).changeLanguage,
          ontTap: () {
            String locale = Intl.getCurrentLocale();
            context
                .read<LocalizationCubit>()
                .updateLocalization(locale == "en" ? "ar" : "en");
          },
        ),
        SizedBox(height: 18.h),
         ProfilePropertyItem(
          icon: Icons.settings_rounded,
          title: S.of(context).setting,
        ),
        SizedBox(height: 18.h),
         ProfilePropertyItem(
          icon: Icons.bar_chart_rounded,
          title: S.of(context).timeWatched,
        ),
        SizedBox(height: 18.h),
         ProfilePropertyItem(
          icon: Icons.help_outline_rounded,
          title: S.of(context).help,
        ),
        SizedBox(height: 18.h),
      ],
    );
  }
}
