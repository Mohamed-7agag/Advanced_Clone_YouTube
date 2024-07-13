import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<String,List<VideoModel>>> fetchSearchedVideos({required String text});
}