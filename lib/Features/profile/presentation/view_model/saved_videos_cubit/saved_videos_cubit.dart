import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_videos_state.dart';

class SavedVideosCubit extends Cubit<SavedVideosState> {
  SavedVideosCubit() : super(SavedVideosToggle());

//! get all saved videos from cache
  List<VideoModel> _getAllSavedVideosFromCache() {
    final videosJsonStr = CacheHelper.getString(savedVideosKey);
    if (videosJsonStr.isEmpty) return [];

    List<dynamic> channelsJson = json.decode(videosJsonStr);
    return channelsJson.map((e) => VideoModel.fromJson(e)).toList();
  }

  //! get all saved channels images from cache
  List<String> _getAllSavedChannelsImagesFromCache() {
    final channelImagesJsonStr =
        CacheHelper.getString(savedVideosChannelImageKey);
    if (channelImagesJsonStr.isEmpty) return [];
    List<String> jsonList = List<String>.from(json.decode(channelImagesJsonStr));
    return jsonList;
  }

//! get all saved videos
  List<dynamic> getAllsavedVideos() {
    return [
      _getAllSavedVideosFromCache(),
      _getAllSavedChannelsImagesFromCache(),
    ];
  }

//! check if a video is saved
  bool isSaved({required VideoModel videoModel}) {
    final List<VideoModel> savedVideos = _getAllSavedVideosFromCache();
    bool isSaved = savedVideos.contains(videoModel);
    emit(SavedVideosIsSavedDone());
    return isSaved;
  }

//! toggle saved videos
  void savedVideoToggle(
      {required VideoModel videoModel, required String channelImage}) {
    List<VideoModel> savedVideos = _getAllSavedVideosFromCache();
    List<String> subscribedChannelsImages =
        _getAllSavedChannelsImagesFromCache();

    if (isSaved(videoModel: videoModel)) {
      savedVideos.remove(videoModel);
      subscribedChannelsImages.remove(channelImage);
    } else {
      savedVideos.add(videoModel);
      subscribedChannelsImages.add(channelImage);
    }

    final jsonList = savedVideos.map((video) => video.toJson()).toList();
    final jsonStr = json.encode(jsonList);

    final channelImagesJsonStr = json.encode(subscribedChannelsImages);

    CacheHelper.setData(
        key: savedVideosChannelImageKey, value: channelImagesJsonStr);
    CacheHelper.setData(key: savedVideosKey, value: jsonStr);

    emit(SavedVideosToggle());
  }
}
