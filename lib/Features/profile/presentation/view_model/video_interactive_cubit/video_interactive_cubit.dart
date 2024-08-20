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
  List<String> savedChannelImages = [];

  void liked({required VideoModel videoModel, required String channelImage}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      savedChannelImages.add(channelImage);

      likedVideos = savedList;
      CacheHelper.setData(key: likedVideosKey, value: likedVideos);
      CacheHelper.setData(key: channelImageKey, value: savedChannelImages);

      emit(VideoInteractiveLiked());
    } else {
      String channelDetailModelStr = json.encode(videoModel.toJson());
      List<String> savedList = CacheHelper.getStringList(likedVideosKey);
      savedList.remove(channelDetailModelStr);
      savedChannelImages.remove(channelImage);
      likedVideos = savedList;
      CacheHelper.setData(key: likedVideosKey, value: likedVideos);
      CacheHelper.setData(key: channelImageKey, value: savedChannelImages);

      emit(VideoInteractiveUnliked());
    }
  }

  void unLiked({required VideoModel videoModel, required String channelImage}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    savedList.remove(channelDetailModelStr);
    savedChannelImages.remove(channelImage);
    likedVideos = savedList;
    CacheHelper.setData(key: likedVideosKey, value: likedVideos);
    CacheHelper.setData(key: channelImageKey, value: savedChannelImages);
    emit(VideoInteractiveUnliked());
  }

  List<dynamic> getLikedVideos() {
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    List<String> savedChannelImages =
        CacheHelper.getStringList(channelImageKey);

    List<VideoModel> videos = [];
    for (var element in savedList) {
      videos.add(VideoModel.fromJson(json.decode(element)));
    }
    emit(VideoInteractiveGetList());
    return [videos, savedChannelImages];
  }
}
