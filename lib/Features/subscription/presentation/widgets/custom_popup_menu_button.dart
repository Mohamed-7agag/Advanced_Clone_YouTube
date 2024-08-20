import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_youtube/Core/utils/app_router.dart';

import '../../../home/data/models/channel_detail_model/channel_detail_model.dart';
import '../view_model/subscription_cubit/subscriptions_cubit.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.channelDetailModel,
  });

  final ChannelDetailModel channelDetailModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      iconSize: 26,
      elevation: 1,
      color: Colors.black87,
      offset: const Offset(-25, 25),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: S.of(context).viewChannel,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.channelDetailsViewRoute,
              arguments: channelDetailModel,
            );
          },
          child: Text(
            S.of(context).viewChannel,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        PopupMenuItem(
          value: S.of(context).unsubscribe,
          onTap: () {
            context.read<SubscriptionCubit>().toggleSubscription(
                  channelDetailModel: channelDetailModel,
                );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.black87,
                content: Text(S.of(context).subscriptionCancelled),
              ),
            );
          },
          child: Text(
            S.of(context).unsubscribe,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
