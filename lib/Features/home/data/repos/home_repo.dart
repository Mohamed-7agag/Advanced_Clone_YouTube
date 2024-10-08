import 'package:dartz/dartz.dart';
import '../models/channel_detail_model/channel_detail_model.dart';
import '../models/video_model/video_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<VideoModel>>> getAllVideos(String? q,String videoType);
  Future<Either<String, ChannelDetailModel>> getChannelDetails(
      {required String channelId});
}
