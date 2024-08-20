part of 'saved_videos_cubit.dart';

sealed class SavedVideosState extends Equatable {
  const SavedVideosState();

  @override
  List<Object> get props => [];
}

final class SavedVideosInitial extends SavedVideosState {}

final class SavedVideosIsSavedDone extends SavedVideosState {}

final class SavedVideosToggle extends SavedVideosState {}

final class SavedVideosListUpdate extends SavedVideosState {}
