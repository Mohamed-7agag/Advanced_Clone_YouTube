import 'package:advanced_youtube/Features/channel_details/data/repos/channel_videos_repo.dart';
import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'channel_videos_state.dart';

class ChannelVideosCubit extends Cubit<ChannelVideosState> {
  ChannelVideosCubit(this.channelVideosRepo) : super(ChannelVideosInitial());
  final ChannelVideosRepo channelVideosRepo;
  Future<void> getChannelVideos({required String channelId}) async {
    emit(ChannelVideosLoading());
    var result =
        await channelVideosRepo.getChannelVideos(channelId: channelId);
    result.fold((exception) {
      emit(ChannelVideosFailure(errMessage: exception.toString()));
    }, (videos) {
      emit(ChannelVideosSuccess(videos: videos));
    });
  }
}
