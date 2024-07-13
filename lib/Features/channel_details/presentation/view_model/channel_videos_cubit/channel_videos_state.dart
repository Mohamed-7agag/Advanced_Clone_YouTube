part of 'channel_videos_cubit.dart';

sealed class ChannelVideosState extends Equatable {
  const ChannelVideosState();

  @override
  List<Object> get props => [];
}

final class ChannelVideosInitial extends ChannelVideosState {}

final class ChannelVideosLoading extends ChannelVideosState {}

final class ChannelVideosFailure extends ChannelVideosState {
  final String errMessage;

  const ChannelVideosFailure({required this.errMessage});
}

final class ChannelVideosSuccess extends ChannelVideosState {
  final List<VideoModel> videos;

  const ChannelVideosSuccess({required this.videos});
}
