import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'video_interactive_state.dart';

class VideoInteractiveCubit extends Cubit<VideoInteractiveState> {
  VideoInteractiveCubit() : super(VideoInteractiveInitial());

  //! get all saved videos from cache
  List<VideoModel> _getAllLikedVideosFromCache() {
    final videosJsonStr = CacheHelper.getString(likedVideosKey);
    if (videosJsonStr.isEmpty) return [];

    List<dynamic> channelsJson = json.decode(videosJsonStr);
    return channelsJson.map((e) => VideoModel.fromJson(e)).toList();
  }

  //! get all saved channels images from cache
  List<String> _getAllLikedChannelsImagesFromCache() {
    final channelImagesJsonStr =
        CacheHelper.getString(likedVideosChannelImageKey);
    if (channelImagesJsonStr.isEmpty) return [];
    List<String> jsonList =
        List<String>.from(json.decode(channelImagesJsonStr));
    
    return jsonList;
  }

//! get all saved videos
  List<dynamic> getAllLikedVideos() {
    return [
      _getAllLikedVideosFromCache(),
      _getAllLikedChannelsImagesFromCache(),
    ];
  }

//! check if a video is saved
  bool isLiked({required VideoModel videoModel}) {
    final List<VideoModel> savedVideos = _getAllLikedVideosFromCache();
    bool isSaved = savedVideos.contains(videoModel);
    emit(VideoInteractiveIsLikedDone());
    return isSaved;
  }

//! toggle saved videos
  void likedVideoToggle(
      {required VideoModel videoModel, required String channelImage}) {
    List<VideoModel> likedVideos = _getAllLikedVideosFromCache();
    List<String> subscribedChannelsImages =
        _getAllLikedChannelsImagesFromCache();

    if (isLiked(videoModel: videoModel)) {
      likedVideos.remove(videoModel);
      subscribedChannelsImages.remove(channelImage);
    } else {
      likedVideos.add(videoModel);
      subscribedChannelsImages.add(channelImage);
    }

    final jsonList = likedVideos.map((video) => video.toJson()).toList();
    final jsonStr = json.encode(jsonList);

    final channelImagesJsonStr = json.encode(subscribedChannelsImages);

    CacheHelper.setData(
        key: likedVideosChannelImageKey, value: channelImagesJsonStr);
    CacheHelper.setData(key: likedVideosKey, value: jsonStr);

    emit(VideoInteractiveToggle());
  }
}
