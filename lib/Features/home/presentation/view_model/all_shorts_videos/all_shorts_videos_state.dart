part of 'all_shorts_videos_cubit.dart';

sealed class AllShortsVideosState extends Equatable {
  const AllShortsVideosState();

  @override
  List<Object> get props => [];
}

final class AllShortsVideosInitial extends AllShortsVideosState {}

final class AllShortsVideosLoading extends AllShortsVideosState {}

final class AllShortsVideosFailure extends AllShortsVideosState {
  final String errMessage;

  const AllShortsVideosFailure({required this.errMessage});
}

final class AllShortsVideosSuccess extends AllShortsVideosState {
  final List<VideoModel> shortsVideos;

  const AllShortsVideosSuccess({required this.shortsVideos});
}
