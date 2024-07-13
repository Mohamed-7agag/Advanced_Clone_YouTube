import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChannelVideosRepo {
  Future<Either<String, List<VideoModel>>> getChannelVideos(
      {required String channelId});
}