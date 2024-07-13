import 'package:advanced_youtube/Features/home/presentation/widgets/shorts_videos_view_body.dart';
import 'package:flutter/material.dart';


class ShortsVideosView extends StatelessWidget {
  const ShortsVideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ShortsVideosViewBody(),
      ),
    );
  }
}
