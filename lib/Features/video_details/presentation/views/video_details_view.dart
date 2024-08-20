import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:flutter/material.dart';

import '../widgets/video_details_view_body.dart';

class VideoDetailsView extends StatelessWidget {
  const VideoDetailsView({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VideoDetailsViewBody(videoModel: videoModel),
      ),
    );
  }
}
