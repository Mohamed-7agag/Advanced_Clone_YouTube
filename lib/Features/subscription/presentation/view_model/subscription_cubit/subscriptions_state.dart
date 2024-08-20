part of 'subscriptions_cubit.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

final class SubscriptionInitial extends SubscriptionState {}

final class SubscriptionIsSubscribedDone extends SubscriptionState {}

final class SubscriptionToggleSuccess extends SubscriptionState {}

final class SubscriptionUpdate extends SubscriptionState {}
