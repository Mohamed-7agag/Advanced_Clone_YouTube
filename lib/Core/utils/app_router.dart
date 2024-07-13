import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/Features/channel_details/data/repos/channel_videos_repo_implement.dart';
import 'package:advanced_youtube/Features/channel_details/presentation/view_model/channel_videos_cubit/channel_videos_cubit.dart';
import 'package:advanced_youtube/Features/channel_details/presentation/views/channel_details_view.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo_implement.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_shorts_videos/all_shorts_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/all_videos_cubit/all_videos_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/channel_details_cubit/channel_details_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/view_model/tabs_cubit.dart';
import 'package:advanced_youtube/Features/home/presentation/views/home_view.dart';
import 'package:advanced_youtube/Features/home/presentation/views/shorts_videos_view.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/views/profile_view.dart';
import 'package:advanced_youtube/Features/search/data/repos/search_repo_implement.dart';
import 'package:advanced_youtube/Features/search/presentation/view_model/cubit/search_video_cubit.dart';
import 'package:advanced_youtube/Features/search/presentation/views/search_view.dart';
import 'package:advanced_youtube/Features/subscription/presentation/views/subscription_view.dart';
import 'package:advanced_youtube/bottom_appbar_cubit.dart';
import 'package:advanced_youtube/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import '../../Features/subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';
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
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      //! customBottomAppBar
      case customBottomAppBarRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AllVideosCubit(
                  getIt.get<HomeRepoImplement>(),
                )..getAllVideos(null),
              ),
              BlocProvider(
                create: (context) => AllShortsVideosCubit(
                  getIt.get<HomeRepoImplement>(),
                )..getAllShortsVideos(),
              ),
              BlocProvider(
                create: (context) => ChannelDetailsCubit(
                  getIt.get<HomeRepoImplement>(),
                ),
              ),
              BlocProvider(
                create: (context) =>
                    SubscriptionsCubit()..getSubscribedChannels(),
              ),
              BlocProvider(
                create: (context) =>
                    BottomNavigationBarCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    TabsCubit(),
              ),
              BlocProvider(
                create: (context) => VideoInteractiveCubit()..getLikedVideos(),
              ),
              BlocProvider(
                create: (context) => SavedVideosCubit()..getsavedVideos(),
              ),
            ],
            child:  CustomBottomAppBar(),
          ),
        );
      //! homeView
      case homeViewRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      //! homeView
      case searchViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                SearchVideoCubit(getIt.get<SearchRepoImplement>()),
            child: const SearchView(),
          ),
        );
      //! shorts Videos View
      case shortsVideosViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ShortsVideosView(),
        );
      //! videoDetailsView
      case videoDetailsViewRoute:
        var args = settings.arguments as VideoModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => VideoStatisticsCubit(
                  getIt.get<VideoStatisticsRepoImplement>(),
                ),
              ),
              BlocProvider(
                create: (context) => SubscriptionsCubit(),
              ),
              BlocProvider(
                create: (context) => VideoInteractiveCubit(),
              ),
              BlocProvider(
                create: (context) => SavedVideosCubit(),
              ),
              BlocProvider(
                create: (context) => ChannelDetailsCubit(
                  getIt.get<HomeRepoImplement>(),
                ),
              ),
            ],
            child: VideoDetailsView(
              videoModel: args,
            ),
          ),
        );
      //! channelDetailsView
      case channelDetailsViewRoute:
        var args = settings.arguments as ChannelDetailModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChannelVideosCubit(
                  getIt.get<ChannelVideosRepoImplement>(),
                ),
              ),
              BlocProvider(
                create: (context) => SubscriptionsCubit(),
              ),
            ],
            child: ChannelDetailsView(
              channelDetailModel: args,
            ),
          ),
        );
      //! subscription View
      case subscriptionViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionView(),
        );
      //! profile View
      case profileViewRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
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
