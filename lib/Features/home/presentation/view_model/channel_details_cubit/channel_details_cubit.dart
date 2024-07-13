import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/channel_detail_model/channel_detail_model.dart';
import '../../../data/repos/home_repo.dart';

part 'channel_details_state.dart';

class ChannelDetailsCubit extends Cubit<ChannelDetailsState> {
  ChannelDetailsCubit(this.homeRepo) : super(ChannelDetailsInitial());
  final HomeRepo homeRepo;

  Future<void> getChannelDetails({required String channelId}) async {
    emit(ChannelDetailsLoading());
    var result = await homeRepo.getChannelDetails(channelId: channelId);
    result.fold((exception) {
      emit(ChannelDetailsFailure(errMessage: exception.toString()));
    }, (details) {
      emit(ChannelDetailsSuccess(channelDetails: details));
    });
  }
}
