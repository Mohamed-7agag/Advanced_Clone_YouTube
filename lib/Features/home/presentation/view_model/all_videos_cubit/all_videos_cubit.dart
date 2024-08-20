import 'package:advanced_youtube/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'all_videos_state.dart';

class AllVideosCubit extends Cubit<AllVideosState> {
  AllVideosCubit(this.homeRepo) : super(AllVideosInitial());

  final HomeRepo homeRepo;

  Future<void> getAllVideos(String? q, String videoType) async {
    emit(AllVideosLoading());

    var result = await homeRepo.getAllVideos(q, videoType);

    result.fold(
      (exception) {
        emit(AllVideosFailure(errMessage: exception.toString()));
      },
      (videos) async {
        // List to hold videos along with their channel details
        List<Map<String, dynamic>> videosWithChannelDetails = [];

        for (var video in videos) {
          if (video.snippet?.channelId != null) {
            var channelDetailsResult = await homeRepo.getChannelDetails(
                channelId: video.snippet!.channelId!);

            channelDetailsResult.fold((exception) {
              emit(AllVideosFailure(errMessage: exception.toString()));
            }, (channelDetails) {
              videosWithChannelDetails.add({
                'video': video,
                'channelDetails': channelDetails,
              });
            });
          }
        }

        emit(
          AllVideosSuccess(videosWithChannelDetails: videosWithChannelDetails),
        );
      },
    );
  }
}
