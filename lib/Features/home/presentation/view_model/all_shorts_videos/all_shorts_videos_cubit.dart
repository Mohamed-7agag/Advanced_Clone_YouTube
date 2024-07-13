import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_shorts_videos_state.dart';

class AllShortsVideosCubit extends Cubit<AllShortsVideosState> {
  AllShortsVideosCubit(this.homeRepo) : super(AllShortsVideosInitial());

  final HomeRepo homeRepo;
  Future<void> getAllShortsVideos() async {
    emit(AllShortsVideosLoading());
    var result = await homeRepo.getAllShortsVideos();
    result.fold((exception) {
      emit(AllShortsVideosFailure(errMessage: exception.toString()));
    }, (shortsVideos) {
      emit(AllShortsVideosSuccess(shortsVideos: shortsVideos));
    });
  }
}
