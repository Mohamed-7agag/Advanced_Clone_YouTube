part of 'video_statistics_cubit.dart';

sealed class VideoStatisticsState extends Equatable {
  const VideoStatisticsState();

  @override
  List<Object> get props => [];
}

final class VideoStatisticsInitial extends VideoStatisticsState {}

final class VideoStatisticsLoading extends VideoStatisticsState {}

final class VideoStatisticsFailure extends VideoStatisticsState {
  final String errMessage;

  const VideoStatisticsFailure({required this.errMessage});
}

final class VideoStatisticsSuccess extends VideoStatisticsState {
  final List<VideoStatisticsModel> videoStatistics;

  const VideoStatisticsSuccess({required this.videoStatistics});
}
