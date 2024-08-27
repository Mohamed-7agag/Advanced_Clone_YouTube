import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Core/widgets/custom_button.dart';
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
    return BlocProvider(
      create: (context) => getIt<SubscriptionCubit>(),
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, subscriptionState) {
          bool isSubscribed = context
              .read<SubscriptionCubit>()
              .isSubscribed(channelDetailModel);
          return CustomButton(
            ok: isSubscribed,
            textStyle: Styles.textStyle13,
            onPressed: () {
              context.read<SubscriptionCubit>().toggleSubscription(
                    channelDetailModel: channelDetailModel,
                  );
            },
          );
        },
      ),
    );
  }
}
