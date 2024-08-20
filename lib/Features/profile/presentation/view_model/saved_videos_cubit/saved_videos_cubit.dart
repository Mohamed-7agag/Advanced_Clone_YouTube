import 'dart:convert';
import 'dart:developer';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_videos_state.dart';

class SavedVideosCubit extends Cubit<SavedVideosState> {
  SavedVideosCubit() : super(SavedVideosToggle());

  List<String> savedChannelImages = [];

  void savedVideoToggle(
      {required VideoModel videoModel, required String channelImage}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(savedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      savedChannelImages.add(channelImage);
    } else {
      savedList.remove(videoModelStr);
      savedChannelImages.remove(channelImage);
    }
    log("saved videos length is ${savedList.length.toString()}");
    log("saved videos images length is ${savedChannelImages.length.toString()}");
    CacheHelper.setData(key: savedVideosKey, value: savedList);
    CacheHelper.setData(key: channelImageKey, value: savedChannelImages);
    emit(SavedVideosToggle());
  }

  bool isSaved({required VideoModel videoModel}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(savedVideosKey);
    emit(SavedVideosIsSavedDone());
    return savedList.contains(channelDetailModelStr);
  }

  List<dynamic> getAllsavedVideos() {
    List<String> savedList = CacheHelper.getStringList(savedVideosKey);
    List<String> savedChannelImages =
        CacheHelper.getStringList(channelImageKey);

    List<VideoModel> videos = savedList.map((item) {
      return VideoModel.fromJson(json.decode(item));
    }).toList();

    emit(SavedVideosListUpdate());
    return [videos, savedChannelImages];
  }
}
