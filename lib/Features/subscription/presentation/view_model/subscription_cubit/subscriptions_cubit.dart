import 'dart:convert';
import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/channel_detail_model/channel_detail_model.dart';

enum SubscriptionsState { subscribed, unsubscribed , getliststate}

class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  SubscriptionsCubit() : super(SubscriptionsState.unsubscribed);

  List<String> subscribedChannels = [];

  void subscribed({required ChannelDetailModel channelDetailModel}) {
    String channelDetailModelStr = json.encode(channelDetailModel.toJson());
    List<String> savedList =
        CacheHelper.getStringList(key: subscribedChannelsKey);
    if (!savedList.contains(channelDetailModelStr)) {
      savedList.add(channelDetailModelStr);
      subscribedChannels = savedList;
      CacheHelper.setData(
          key: subscribedChannelsKey, value: subscribedChannels);
      emit(SubscriptionsState.subscribed);
      
    }
    else{
      String channelDetailModelStr = json.encode(channelDetailModel.toJson());
    List<String> savedList =
        CacheHelper.getStringList(key: subscribedChannelsKey);
    savedList.remove(channelDetailModelStr);
    subscribedChannels = savedList;
    CacheHelper.setData(key: subscribedChannelsKey, value: subscribedChannels);
    emit(SubscriptionsState.unsubscribed);
    }
  }

  void unSubscribed({required ChannelDetailModel channelDetailModel}) {
    String channelDetailModelStr = json.encode(channelDetailModel.toJson());
    List<String> savedList =
        CacheHelper.getStringList(key: subscribedChannelsKey);
    savedList.remove(channelDetailModelStr);
    subscribedChannels = savedList;
    CacheHelper.setData(key: subscribedChannelsKey, value: subscribedChannels);
    emit(SubscriptionsState.unsubscribed);
  }

  List<ChannelDetailModel> getSubscribedChannels() {
    List<String> savedList = CacheHelper.getStringList(key: subscribedChannelsKey);

    List<ChannelDetailModel> subscribedChannel = [];
    for (var element in savedList) {
      subscribedChannel.add(ChannelDetailModel.fromJson(json.decode(element)));
    }
    emit(SubscriptionsState.getliststate);
    return subscribedChannel;
  }
}
