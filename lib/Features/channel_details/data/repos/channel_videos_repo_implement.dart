import 'package:advanced_youtube/Core/api/api_service.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';
import 'package:advanced_youtube/Features/channel_details/data/repos/channel_videos_repo.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:dartz/dartz.dart';

class ChannelVideosRepoImplement implements ChannelVideosRepo {
  final ApiServices apiServices;

  ChannelVideosRepoImplement({required this.apiServices});
  @override
  Future<Either<String, List<VideoModel>>> getChannelVideos(
      {required String channelId}) async {
    try {
      var data = await apiServices.getChannelVideos(channelId: channelId);
      List<VideoModel> videos = [];
      for (var item in data['items']) {
        videos.add(VideoModel.fromJson(item));
      }
      return right(videos);
    } on ServerException catch (e) {
      return left(e.errModel.errorMessage);
    }
  }
}
