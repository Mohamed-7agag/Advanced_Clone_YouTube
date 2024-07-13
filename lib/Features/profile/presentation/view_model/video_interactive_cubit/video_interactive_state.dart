part of 'video_interactive_cubit.dart';

sealed class VideoInteractiveState extends Equatable {
  const VideoInteractiveState();

  @override
  List<Object> get props => [];
}

final class VideoInteractiveLiked extends VideoInteractiveState {}
final class VideoInteractiveUnliked extends VideoInteractiveState {}
final class VideoInteractiveGetList extends VideoInteractiveState {}
