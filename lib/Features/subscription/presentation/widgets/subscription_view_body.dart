import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/Core/utils/styles.dart';

import 'subscription_bloc_builder.dart';

class SubscriptionViewBody extends StatelessWidget {
  const SubscriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text(
            "Your Subscriptions",
            style: Styles.textStyle20,
          ),
          Divider(
            thickness: 1,
            color: kGrey100,
            height: 24,
          ),
          const SubscriptionBlocBuilder(),
        ],
      ),
    );
  }
}
