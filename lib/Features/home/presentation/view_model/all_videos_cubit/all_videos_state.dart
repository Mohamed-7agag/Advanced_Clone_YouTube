part of 'all_videos_cubit.dart';

sealed class AllVideosState extends Equatable {
  const AllVideosState();

  @override
  List<Object> get props => [];
}

final class AllVideosInitial extends AllVideosState {}

final class AllVideosLoading extends AllVideosState {}

final class AllVideosFailure extends AllVideosState {
  final String errMessage;

  const AllVideosFailure({required this.errMessage});
}

final class AllVideosSuccess extends AllVideosState {
  final List<VideoModel> videos;

  const AllVideosSuccess({required this.videos});
}
