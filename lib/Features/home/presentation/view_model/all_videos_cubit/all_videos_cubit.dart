import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../channel_details_cubit/channel_details_cubit.dart';
part 'all_videos_state.dart';

class AllVideosCubit extends Cubit<AllVideosState> {
  AllVideosCubit(this.homeRepo) : super(AllVideosInitial());
  final HomeRepo homeRepo;
  Future<void> getAllVideos(String? q) async {
    emit(AllVideosLoading());
    var result = await homeRepo.getAllVideos(q);
    result.fold((exception) {
      emit(AllVideosFailure(errMessage: exception.toString()));
    }, (videos) {
      // videos.map((e) async {
      //   await ChannelDetailsCubit(homeRepo)
      //       .getChannelDetails(channelId: e.snippet!.channelId!);
      // });
      emit(AllVideosSuccess(videos: videos));
    });
  }
}
