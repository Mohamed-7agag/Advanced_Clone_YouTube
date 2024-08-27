import 'package:advanced_youtube/Core/api/api_service.dart';
import 'package:advanced_youtube/Features/channel_details/data/repos/channel_videos_repo_implement.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo_implement.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'package:advanced_youtube/Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';
import 'package:advanced_youtube/Features/search/data/repos/search_repo_implement.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';
import '../../Features/video_details/data/repos/video_statistics_repo_implement.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<VideoStatisticsRepoImplement>(
    VideoStatisticsRepoImplement(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<ChannelVideosRepoImplement>(
    ChannelVideosRepoImplement(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      apiServices: getIt.get<ApiServices>(),
    ),
  );

  getIt.registerFactory<SubscriptionCubit>(() => SubscriptionCubit());
  getIt.registerFactory<SavedVideosCubit>(() => SavedVideosCubit());
  getIt.registerFactory<VideoInteractiveCubit>(() => VideoInteractiveCubit());
}
