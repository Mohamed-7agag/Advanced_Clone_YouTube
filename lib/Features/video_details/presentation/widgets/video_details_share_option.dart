import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import '../../../home/data/models/video_model/video_model.dart';

class VideoDetailsShareOption extends StatelessWidget {
  const VideoDetailsShareOption({super.key, required this.videoModel});

  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share(videoModel.id?.videoId ?? '');
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            const Icon(Icons.share, size: 19),
            SizedBox(width: 8.w),
            Text(S.of(context).share),
          ],
        ),
      ),
    );
  }
}
