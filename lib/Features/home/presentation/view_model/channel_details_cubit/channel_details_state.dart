part of 'channel_details_cubit.dart';

sealed class ChannelDetailsState extends Equatable {
  const ChannelDetailsState();

  @override
  List<Object> get props => [];
}

final class ChannelDetailsInitial extends ChannelDetailsState {}

final class ChannelDetailsLoading extends ChannelDetailsState {}

final class ChannelDetailsFailure extends ChannelDetailsState {
  final String errMessage;

  const ChannelDetailsFailure({required this.errMessage});
}

final class ChannelDetailsSuccess extends ChannelDetailsState {
  final ChannelDetailModel channelDetails;

  const ChannelDetailsSuccess({required this.channelDetails});
}
