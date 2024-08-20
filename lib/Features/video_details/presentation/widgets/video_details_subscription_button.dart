import 'dart:developer';

import 'package:advanced_youtube/Core/widgets/custom_button.dart';
import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/channel_detail_model/channel_detail_model.dart';
import '../../../subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';

class VideoDetailsSubscriptionButton extends StatelessWidget {
  const VideoDetailsSubscriptionButton(
      {super.key, required this.channelDetailModel});
  final ChannelDetailModel channelDetailModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      buildWhen: (previous, current) {
        log('previous$previous');
        log('current$current');
        return previous != current;
      },
      builder: (context, subscriptionState) {
        bool isSubscribed =
            context.read<SubscriptionCubit>().isSubscribed(channelDetailModel);
        return CustomButton(
          text: isSubscribed ? S.of(context).subscribed : S.of(context).subscribe,
          backgroundColor: isSubscribed ? Colors.grey[300]! : Colors.black,
          foregroundColor: isSubscribed ? Colors.black : Colors.white,
          icon: isSubscribed
              ? const Icon(
                  Icons.done_rounded,
                  size: 23,
                  color: Colors.green,
                )
              : const Text(""),
          onPressed: () {
            context.read<SubscriptionCubit>().toggleSubscription(
                  channelDetailModel: channelDetailModel,
                );
          },
        );
      },
    );
  }
}
