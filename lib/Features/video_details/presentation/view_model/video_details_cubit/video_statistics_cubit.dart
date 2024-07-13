import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/video_statistics_model/video_statistics_model.dart';
import '../../../data/repos/video_statistics_repo.dart';

part 'video_statistics_state.dart';

class VideoStatisticsCubit extends Cubit<VideoStatisticsState> {
  VideoStatisticsCubit(this.videoStatisticsRepo) : super(VideoStatisticsInitial());

  final VideoStatisticsRepo videoStatisticsRepo;

  Future<void> getVideoStatistics({required String videoId}) async {
    emit(VideoStatisticsLoading());
    var result = await videoStatisticsRepo.getVideoStatistics(videoId: videoId);
    result.fold((exception) {
      emit(VideoStatisticsFailure(errMessage: exception.toString()));
    }, (statistics) {
      emit(VideoStatisticsSuccess(videoStatistics: statistics));
    });
  }
}
