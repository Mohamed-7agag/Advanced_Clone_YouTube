import 'package:equatable/equatable.dart';

import 'thumbnails.dart';

class Snippet extends Equatable {
  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Thumbnails? thumbnails;
  final String? channelTitle;
  final String? liveBroadcastContent;
  final String? publishTime;

  const Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json['publishedAt'] as String?,
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: json['thumbnails'] == null
            ? null
            : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        channelTitle: json['channelTitle'] as String?,
        liveBroadcastContent: json['liveBroadcastContent'] as String?,
        publishTime: json['publishTime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt,
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.toJson(),
        'channelTitle': channelTitle,
        'liveBroadcastContent': liveBroadcastContent,
        'publishTime': publishTime,
      };

  @override
  List<Object?> get props {
    return [
      publishedAt,
      channelId,
      title,
      description,
      thumbnails,
      channelTitle,
      liveBroadcastContent,
      publishTime,
    ];
  }
}
