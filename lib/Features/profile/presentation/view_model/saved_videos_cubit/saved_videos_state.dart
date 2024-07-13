part of 'saved_videos_cubit.dart';

sealed class SavedVideosState extends Equatable {
  const SavedVideosState();

  @override
  List<Object> get props => [];
}

final class SavedVideosSaved extends SavedVideosState {}
final class SavedVideosUnsaved extends SavedVideosState {}
final class SavedVideosGetList extends SavedVideosState {}
