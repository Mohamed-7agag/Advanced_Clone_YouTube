import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'video_interactive_state.dart';

class VideoInteractiveCubit extends Cubit<VideoInteractiveState> {
  VideoInteractiveCubit() : super(VideoInteractiveInitial());

  List<String> savedChannelImages = [];

  void interavtiveToggle(
      {required VideoModel videoModel, required String channelImage}) {
    String videoModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    if (!savedList.contains(videoModelStr)) {
      savedList.add(videoModelStr);
      savedChannelImages.add(channelImage);
    } else {
      savedList.remove(videoModelStr);
      savedChannelImages.remove(channelImage);
    }
    CacheHelper.setData(key: likedVideosKey, value: savedList);
    CacheHelper.setData(key: likedVideosChannelImageKey, value: savedChannelImages);
    emit(VideoInteractiveToggle());
  }

  bool isLiked({required VideoModel videoModel}) {
    String channelDetailModelStr = json.encode(videoModel.toJson());
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    emit(VideoInteractiveIsLikedDone());
    return savedList.contains(channelDetailModelStr);
  }

  List<dynamic> getAllLikedVideos() {
    List<String> savedList = CacheHelper.getStringList(likedVideosKey);
    List<String> savedChannelImages =
        CacheHelper.getStringList(likedVideosChannelImageKey);

    List<VideoModel> videos = savedList.map((item) {
      return VideoModel.fromJson(json.decode(item));
    }).toList();

    //emit(VideoInteractiveListUpdate());
    return [videos, savedChannelImages];
  }
}
