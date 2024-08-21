import 'package:flutter/material.dart';

import 'shimmer_effects/video_item_shimmer_effect.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return const VideoItemShimmerEffect();
            },
          ),
        ),
      ],
    );
  }
}
