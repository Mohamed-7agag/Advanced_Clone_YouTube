import 'package:advanced_youtube/Core/api/api_service.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImplement({required this.apiServices});
  @override
  Future<Either<String, List<VideoModel>>> fetchSearchedVideos(
      {required String text}) async {
    try {
      var data = await apiServices.getSearchedVideos(text: text);
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
