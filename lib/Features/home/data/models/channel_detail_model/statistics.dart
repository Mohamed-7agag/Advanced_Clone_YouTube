import 'package:equatable/equatable.dart';

class Statistics extends Equatable {
  final String? viewCount;
  final String? subscriberCount;
  final bool? hiddenSubscriberCount;
  final String? videoCount;

  const Statistics({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json['viewCount'] as String?,
        subscriberCount: json['subscriberCount'] as String?,
        hiddenSubscriberCount: json['hiddenSubscriberCount'] as bool?,
        videoCount: json['videoCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'viewCount': viewCount,
        'subscriberCount': subscriberCount,
        'hiddenSubscriberCount': hiddenSubscriberCount,
        'videoCount': videoCount,
      };

  @override
  List<Object?> get props {
    return [
      viewCount,
      subscriberCount,
      hiddenSubscriberCount,
      videoCount,
    ];
  }
}
