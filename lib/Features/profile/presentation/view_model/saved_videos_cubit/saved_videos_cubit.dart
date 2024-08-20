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
  List<String> savedChannelImages = [];

  void saved({required VideoModel videoModel,required String channelImage}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList( savedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      savedChannelImages.add(channelImage);
      savedVideos = savedList;
      CacheHelper.setData(key: savedVideosKey, value: savedVideos);
      CacheHelper.setData(key: channelImageKey, value: savedChannelImages);
      emit(SavedVideosSaved());
    } else {
      String channelDetailModelStr = json.encode(videoModel.toJson());
      List<String> savedList = CacheHelper.getStringList(savedVideosKey);
      savedList.remove(channelDetailModelStr);
       savedChannelImages.remove(channelImage);
      savedVideos = savedList;
      CacheHelper.setData(key: savedVideosKey, value: savedVideos);
      CacheHelper.setData(key: channelImageKey, value: savedChannelImages);
      emit(SavedVideosUnsaved());
    }
  }

  void unSaved({required VideoModel videoModel,required String channelImage}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(savedVideosKey);
    savedList.remove(channelDetailModelStr);
    savedChannelImages.remove(channelImage);
    savedVideos = savedList;
    CacheHelper.setData(key: savedVideosKey, value: savedVideos);
    CacheHelper.setData(key: channelImageKey, value: savedChannelImages);
    emit(SavedVideosUnsaved());
  }

  List<dynamic> getsavedVideos() {
    List<String> savedList = CacheHelper.getStringList(savedVideosKey);
    List<String> savedChannelImages = CacheHelper.getStringList(channelImageKey);
    

    List<VideoModel> videos = [];
    for (var element in savedList) {
      videos.add(VideoModel.fromJson(json.decode(element)));
    }
    emit(SavedVideosGetList());
    return [videos,savedChannelImages];
  }
}
