part of 'all_videos_cubit.dart';

abstract class AllVideosState extends Equatable {
  const AllVideosState();

  @override
  List<Object> get props => [];
}

class AllVideosInitial extends AllVideosState {}

class AllVideosLoading extends AllVideosState {}

class AllVideosFailure extends AllVideosState {
  final String errMessage;

  const AllVideosFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

class AllVideosSuccess extends AllVideosState {
  final List<Map<String, dynamic>> videosWithChannelDetails;

  const AllVideosSuccess({required this.videosWithChannelDetails});

  @override
  List<Object> get props => [videosWithChannelDetails];
}
