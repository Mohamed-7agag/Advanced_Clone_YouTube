part of 'video_interactive_cubit.dart';

sealed class VideoInteractiveState extends Equatable {
  const VideoInteractiveState();

  @override
  List<Object> get props => [];
}

final class VideoInteractiveInitial extends VideoInteractiveState {}

final class VideoInteractiveIsLikedDone extends VideoInteractiveState {}

final class VideoInteractiveToggle extends VideoInteractiveState {}

final class VideoInteractiveListUpdate extends VideoInteractiveState {}
