import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/Core/widgets/custom_error_widget.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo_implement.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsVideosViewBody extends StatefulWidget {
  const ShortsVideosViewBody({super.key});

  @override
  State<ShortsVideosViewBody> createState() => _ShortsVideosViewBodyState();
}

class _ShortsVideosViewBodyState extends State<ShortsVideosViewBody> {
  final PageController _pageController = PageController();
  final Map<int, YoutubePlayerController> _controllers = {};
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _disposeYouTubeControllers();
    super.dispose();
  }

  void _disposeYouTubeControllers() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });

    // Pause all controllers except the current one
    _controllers.forEach((key, controller) {
      if (key != index) {
        controller.pause();
      }
    });

    // Play the current video
    _controllers[index]?.play();

    // Preload the next video
    if (index + 1 < _controllers.length) {
      _controllers[index + 1]?.load(_controllers[index + 1]!.initialVideoId);
    }

    // Optionally preload the previous video
    if (index - 1 >= 0) {
      _controllers[index - 1]?.load(_controllers[index - 1]!.initialVideoId);
    }
  }

  YoutubePlayerController _initializeController(String videoId) {
    return YoutubePlayerController(initialVideoId: videoId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllVideosCubit(getIt.get<HomeRepoImplement>())
        ..getAllVideos(null, 'short'),
      child: BlocBuilder<AllVideosCubit, AllVideosState>(
        builder: (context, state) {
          if (state is AllVideosSuccess) {
            // Extract video IDs from the state
            List<String> videoIds = state.videosWithChannelDetails
                .map<String>((videoWithChannelDetail) =>
                    videoWithChannelDetail['video'].id.videoId)
                .toList();

            return PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: videoIds.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                // Initialize the controller for the current, previous, and next videos
                if (!_controllers.containsKey(index)) {
                  _controllers[index] = _initializeController(videoIds[index]);
                }

                return YoutubePlayer(
                  controller: _controllers[index]!,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    if (index == _currentPage) {
                      _controllers[index]?.play();
                    }
                  },
                );
              },
            );
          } else if (state is AllVideosFailure) {
            return const CustomErrorWidget();
          }
          return const Center(
              child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }
}
