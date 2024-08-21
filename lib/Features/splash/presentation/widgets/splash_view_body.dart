// ignore_for_file: use_build_context_synchronously

import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(
            context, AppRouter.customBottomAppBarRoute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/youtube.svg',
        width: 125.w,
      ),
    );
  }
}
