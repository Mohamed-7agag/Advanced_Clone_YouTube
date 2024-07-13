part of 'search_video_cubit.dart';

sealed class SearchVideoState extends Equatable {
  const SearchVideoState();

  @override
  List<Object> get props => [];
}

final class SearchVideoInitial extends SearchVideoState {}

final class SearchVideoLoading extends SearchVideoState {}

final class SearchVideoFailure extends SearchVideoState {
  final String errMessage;

  const SearchVideoFailure({required this.errMessage});
}

final class SearchVideoSuccess extends SearchVideoState {
  final List<VideoModel> searchedVideos;

  const SearchVideoSuccess({required this.searchedVideos});
}
