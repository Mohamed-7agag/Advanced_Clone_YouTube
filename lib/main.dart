import 'package:advanced_youtube/Core/utils/app_router.dart';
import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Features/profile/presentation/view_model/saved_videos_cubit/saved_videos_cubit.dart';
import 'Features/profile/presentation/view_model/video_interactive_cubit/video_interactive_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  setUp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => VideoInteractiveCubit()..getLikedVideos(),
      ),
      BlocProvider(
        create: (context) => SavedVideosCubit()..getsavedVideos(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.splashViewRoute,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
