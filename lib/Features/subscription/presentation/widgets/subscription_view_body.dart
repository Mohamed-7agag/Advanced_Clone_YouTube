import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:advanced_youtube/Features/home/data/models/channel_detail_model/channel_detail_model.dart';
import 'package:advanced_youtube/Features/subscription/presentation/view_model/subscription_cubit/subscriptions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'subscription_list_view_item.dart';

class SubscriptionViewBody extends StatelessWidget {
  const SubscriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Your Subscriptions",
            style: Styles.textStyle20,
          ),
        ),
        Divider(
          thickness: 1,
          color: kGrey100,
        ),
        BlocBuilder<SubscriptionsCubit, SubscriptionsState>(
          builder: (context, state) {
            List<ChannelDetailModel> items =
                context.read<SubscriptionsCubit>().getSubscribedChannels();
            return Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SubscriptionListViewItem(
                          channelDetailModel: items[index],
                        ),
                      ),
                      Divider(thickness: 0.4, color: kGrey300),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
