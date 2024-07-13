import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'video_interactive_state.dart';

class VideoInteractiveCubit extends Cubit<VideoInteractiveState> {
  VideoInteractiveCubit() : super(VideoInteractiveUnliked());

  List<String> likedVideos = [];

  void liked({required VideoModel videoModel}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(key: likedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      likedVideos = savedList;
      CacheHelper.setData(key: likedVideosKey, value: likedVideos);
      emit(VideoInteractiveLiked());
    } else {
      String channelDetailModelStr = json.encode(videoModel.toJson());
      List<String> savedList = CacheHelper.getStringList(key: likedVideosKey);
      savedList.remove(channelDetailModelStr);
      likedVideos = savedList;
      CacheHelper.setData(key: likedVideosKey, value: likedVideos);
      emit(VideoInteractiveUnliked());
    }
  }

  void unLiked({required VideoModel videoModel}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(key: likedVideosKey);
    savedList.remove(channelDetailModelStr);
    likedVideos = savedList;
    CacheHelper.setData(key: likedVideosKey, value: likedVideos);
    emit(VideoInteractiveUnliked());
  }

  List<VideoModel> getLikedVideos() {
    List<String> savedList = CacheHelper.getStringList(key: likedVideosKey);

    List<VideoModel> videos = [];
    for (var element in savedList) {
      videos.add(VideoModel.fromJson(json.decode(element)));
    }
    emit(VideoInteractiveGetList());
    return videos;
  }
}
