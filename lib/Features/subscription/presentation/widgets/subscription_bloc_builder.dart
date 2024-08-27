import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/channel_detail_model/channel_detail_model.dart';
import '../view_model/subscription_cubit/subscriptions_cubit.dart';
import 'subscription_list_view_item.dart';

class SubscriptionBlocBuilder extends StatelessWidget {
  const SubscriptionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubscriptionCubit>(),
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          List<ChannelDetailModel> channels =
              context.read<SubscriptionCubit>().getAllSubscribedChannels();
          return Expanded(
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (BuildContext context, int index) {
                return SubscriptionListViewItem(
                  channelDetailModel: channels[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
