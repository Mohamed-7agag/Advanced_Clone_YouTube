import 'package:advanced_youtube/Core/api/api_service.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplement({required this.apiServices});

  //! method to get all Videos and video Details
  @override
  Future<Either<String, List<VideoModel>>> getAllVideos(
      String? q, String videoType) async {
    try {
      var data = await apiServices.getAllVideos(q, videoType);
      List<VideoModel> videos = [];
      for (var item in data['items']) {
        videos.add(VideoModel.fromJson(item));
      }
      return right(videos);
    } on ServerException catch (e) {
      return left(e.errModel.errorMessage);
    }
  }

  //! method to get Channel Details
  @override
  Future<Either<String, ChannelDetailModel>> getChannelDetails(
      {required String channelId}) async {
    try {
      var data = await apiServices.getChannelDetails(channelId: channelId);
      ChannelDetailModel channelDetails =
          ChannelDetailModel.fromJson(data['items'][0]);
      return right(channelDetails);
    } on ServerException catch (e) {
      return left(e.errModel.errorMessage);
    }
  }
}
