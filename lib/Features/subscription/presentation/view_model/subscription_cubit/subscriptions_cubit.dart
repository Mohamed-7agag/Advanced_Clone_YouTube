import 'dart:convert';
import 'dart:developer';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscriptions_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  List<ChannelDetailModel> getAllSubscribedChannels() {
    List<String> savedList = CacheHelper.getStringList(subscribedChannelsKey);
    List<ChannelDetailModel> subscribedChannels = savedList.map((item) {
      return ChannelDetailModel.fromJson(json.decode(item));
    }).toList();
  log('Get all subscription');
    //emit(SubscriptionUpdate());
    return subscribedChannels;
  }

  bool isSubscribed(ChannelDetailModel channelDetailModel) {
    List<String> favList = CacheHelper.getStringList(subscribedChannelsKey);
    String channelDetailModelStr = json.encode(channelDetailModel.toJson());
    log('isSubscribed subscription');
    emit(SubscriptionIsSubscribedDone());
    return favList.contains(channelDetailModelStr);
  }

  void toggleSubscription({required ChannelDetailModel channelDetailModel}) {
    String channelDetailModelStr = json.encode(channelDetailModel.toJson());
    List<String> savedList = CacheHelper.getStringList(subscribedChannelsKey);
    log('toggle subscription');
    if (savedList.contains(channelDetailModelStr)) {
      savedList.remove(channelDetailModelStr);
    } else {
      savedList.add(channelDetailModelStr);
    }
    CacheHelper.setData(key: subscribedChannelsKey, value: savedList);
    emit(SubscriptionToggleSuccess());
  }
}
