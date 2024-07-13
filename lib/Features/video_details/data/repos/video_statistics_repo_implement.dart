import 'package:advanced_youtube/Core/api/api_service.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';


import 'package:dartz/dartz.dart';

import '../models/video_statistics_model/video_statistics_model.dart';
import 'video_statistics_repo.dart';

class VideoStatisticsRepoImplement implements VideoStatisticsRepo {
  final ApiServices apiServices;

  VideoStatisticsRepoImplement({required this.apiServices});

  //! method to get Video Statistics
  @override
  Future<Either<String, List<VideoStatisticsModel>>> getVideoStatistics(
      {required String videoId}) async {
    try {
      var data = await apiServices.getVideoStatistics(videoId: videoId);
      List<VideoStatisticsModel> videoStatisticsModel = [];
      for (var item in data['items']) {
        videoStatisticsModel.add(VideoStatisticsModel.fromJson(item));
      }
      return right(videoStatisticsModel);
    } on ServerException catch (e) {
      return left(e.errModel.errorMessage);
    }
  }
}
