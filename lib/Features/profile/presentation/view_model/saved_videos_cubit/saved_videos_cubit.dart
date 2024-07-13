import 'dart:convert';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_videos_state.dart';

class SavedVideosCubit extends Cubit<SavedVideosState> {
  SavedVideosCubit() : super(SavedVideosUnsaved());

  List<String> savedVideos = [];

  void saved({required VideoModel videoModel}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(key: savedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      savedVideos = savedList;
      CacheHelper.setData(key: savedVideosKey, value: savedVideos);
      emit(SavedVideosSaved());
    } else {
      String channelDetailModelStr = json.encode(videoModel.toJson());
      List<String> savedList = CacheHelper.getStringList(key: savedVideosKey);
      savedList.remove(channelDetailModelStr);
      savedVideos = savedList;
      CacheHelper.setData(key: savedVideosKey, value: savedVideos);
      emit(SavedVideosUnsaved());
    }
  }

  void unSaved({required VideoModel videoModel}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(key: savedVideosKey);
    savedList.remove(channelDetailModelStr);
    savedVideos = savedList;
    CacheHelper.setData(key: savedVideosKey, value: savedVideos);
    emit(SavedVideosUnsaved());
  }

  List<VideoModel> getsavedVideos() {
    List<String> savedList = CacheHelper.getStringList(key: savedVideosKey);

    List<VideoModel> videos = [];
    for (var element in savedList) {
      videos.add(VideoModel.fromJson(json.decode(element)));
    }
    emit(SavedVideosGetList());
    return videos;
  }
}
