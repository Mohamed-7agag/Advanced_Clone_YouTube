import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';

import '../../../../home/data/models/channel_detail_model/channel_detail_model.dart';

part 'subscriptions_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

//! Get all subscribed channels from cache
  List<ChannelDetailModel> _getSubscribedChannelsFromCache() {
    final channelJsonStr = CacheHelper.getString(subscribedChannelsKey);

    if (channelJsonStr.isEmpty) return [];

    List<dynamic> channelsJson = json.decode(channelJsonStr);
    return channelsJson.map((e) => ChannelDetailModel.fromJson(e)).toList();
  }

  //! Get all subscribed channels
  List<ChannelDetailModel> getAllSubscribedChannels() {
    return _getSubscribedChannelsFromCache();
  }

  //! Check if a channel is subscribed
  bool isSubscribed(ChannelDetailModel channelDetailModel) {
    final List<ChannelDetailModel> subscribedChannels =
        _getSubscribedChannelsFromCache();
    bool isSubscribed = subscribedChannels.contains(channelDetailModel);
    emit(SubscriptionIsSubscribedDone());
    return isSubscribed;
  }

  //! Toggle subscription
  void toggleSubscription({required ChannelDetailModel channelDetailModel}) {
    List<ChannelDetailModel> subscribedChannels =
        _getSubscribedChannelsFromCache();

    if (isSubscribed(channelDetailModel)) {
      subscribedChannels.remove(channelDetailModel);
    } else {
      subscribedChannels.add(channelDetailModel);
    }

    final jsonList =
        subscribedChannels.map((channel) => channel.toJson()).toList();
    final jsonStr = json.encode(jsonList);

    CacheHelper.setData(key: subscribedChannelsKey, value: jsonStr);

    emit(SubscriptionToggleSuccess());
  }
}
