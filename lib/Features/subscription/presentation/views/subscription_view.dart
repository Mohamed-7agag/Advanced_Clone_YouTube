import 'package:advanced_youtube/Features/subscription/presentation/widgets/subscription_view_body.dart';
import 'package:flutter/material.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SubscriptionViewBody()),
    );
  }
}
