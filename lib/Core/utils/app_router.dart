import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/Features/channel_details/data/repos/channel_videos_repo_implement.dart';
import 'package:advanced_youtube/Features/channel_details/presentation/view_model/channel_videos_cubit/channel_videos_cubit.dart';
import 'package:advanced_youtube/Features/channel_details/presentation/views/channel_details_view.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo_implement.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/views/home_view.dart';
import 'package:advanced_youtube/Features/home/presentation/views/shorts_videos_view.dart';
import 'package:advanced_youtube/Features/profile/presentation/views/profile_view.dart';
import 'package:advanced_youtube/Features/search/data/repos/search_repo_implement.dart';
import 'package:advanced_youtube/Features/search/presentation/view_model/cubit/search_video_cubit.dart';
import 'package:advanced_youtube/Features/search/presentation/views/search_view.dart';
import 'package:advanced_youtube/Features/subscription/presentation/views/subscription_view.dart';
import 'package:advanced_youtube/bottom_appbar_cubit.dart';
import 'package:advanced_youtube/custom_bottom_appbar.dart';

import '../../Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import '../../Features/video_details/data/repos/video_statistics_repo_implement.dart';
import '../../Features/video_details/presentation/view_model/video_details_cubit/video_statistics_cubit.dart';
import '../../Features/video_details/presentation/views/video_details_view.dart';

class AppRouter {
  //! Routes Name
  static const String splashViewRoute = '/';
  static const String homeViewRoute = '/homeView';
  static const String videoDetailsViewRoute = '/videoDetailsView';
  static const String channelDetailsViewRoute = '/channelDetailsView';
  static const String shortsVideosViewRoute = '/shortsVideosView';
  static const String customBottomAppBarRoute = '/customButtomAppBarView';
  static const String subscriptionViewRoute = '/subscriptionView';
  static const String profileViewRoute = '/profileView';
  static const String searchViewRoute = '/searchView';
  //! Generate Routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //! splashView
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      //! customBottomAppBar
      case customBottomAppBarRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AllVideosCubit(getIt.get<HomeRepoImplement>())
                  ..getAllVideos(null, 'medium'),
              ),
              BlocProvider(
                create: (_) => ChannelDetailsCubit(
                  getIt.get<HomeRepoImplement>(),
                ),
              ),
              BlocProvider(create: (_) => BottomNavigationBarCubit()),
              //BlocProvider(create: (_) => SubscriptionCubit()),
              BlocProvider(create: (_) => TabsCubit()),
              // BlocProvider(
              //     create: (_) => VideoInteractiveCubit()..getLikedVideos()),
              // BlocProvider(create: (_) => SavedVideosCubit()..getsavedVideos()),
            ],
            child: CustomBottomAppBar(),
          ),
        );
      //! homeView
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      //! searchView
      case searchViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SearchVideoCubit(getIt.get<SearchRepoImplement>()),
            child: const SearchView(),
          ),
        );
      //! shorts Videos View
      case shortsVideosViewRoute:
        return MaterialPageRoute(builder: (_) => const ShortsVideosView());
      //! videoDetailsView
      case videoDetailsViewRoute:
        var args = settings.arguments as VideoModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => VideoStatisticsCubit(
                    getIt.get<VideoStatisticsRepoImplement>())
                  ..getVideoStatistics(videoId: args.id?.videoId ?? ''),
              ),
              // BlocProvider(create: (_) => SubscriptionCubit()),
              // BlocProvider(create: (_) => VideoInteractiveCubit()),
              // BlocProvider(create: (_) => SavedVideosCubit()),
              BlocProvider(
                create: (_) => ChannelDetailsCubit(
                    getIt.get<HomeRepoImplement>())
                  ..getChannelDetails(channelId: args.snippet?.channelId ?? ''),
              ),
            ],
            child: VideoDetailsView(videoModel: args),
          ),
        );
      //! channelDetailsView
      case channelDetailsViewRoute:
        var args = settings.arguments as ChannelDetailModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    ChannelVideosCubit(getIt.get<ChannelVideosRepoImplement>())
                      ..getChannelVideos(channelId: args.id!),
              ),
              // BlocProvider.value(
              //   value: BlocProvider.of<SubscriptionCubit>(_),
              // ),
            ],
            child: ChannelDetailsView(channelDetailModel: args),
          ),
        );
      //! subscription View
      case subscriptionViewRoute:
        return MaterialPageRoute(builder: (_) => const SubscriptionView());
      //! profile View
      case profileViewRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text("No Routes Found!"),
              ),
            );
          },
        );
    }
  }
}
