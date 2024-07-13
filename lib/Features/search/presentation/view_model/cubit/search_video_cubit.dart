import 'package:advanced_youtube/Features/home/data/models/video_model/video_model.dart';
import 'package:advanced_youtube/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_video_state.dart';

class SearchVideoCubit extends Cubit<SearchVideoState> {
  SearchVideoCubit(this.searchRepo) : super(SearchVideoInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchedVideos({required String text}) async {
    emit(SearchVideoLoading());
    var result = await searchRepo.fetchSearchedVideos(text: text);
    result.fold((failure) {
      emit(SearchVideoFailure(errMessage: failure.toString()));
    }, (videos) {
      emit(SearchVideoSuccess(searchedVideos: videos));
    });
  }
}
