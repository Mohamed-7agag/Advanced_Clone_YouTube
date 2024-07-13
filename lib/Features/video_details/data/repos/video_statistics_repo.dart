import 'package:dartz/dartz.dart';

import '../models/video_statistics_model/video_statistics_model.dart';

abstract class VideoStatisticsRepo {
  Future<Either<String, List<VideoStatisticsModel>>> getVideoStatistics(
      {required String videoId});
}