import 'package:equatable/equatable.dart';

import 'localized.dart';
import 'thumbnails.dart';

class Snippet extends Equatable {
  final String? title;
  final String? description;
  final String? customUrl;
  final DateTime? publishedAt;
  final Thumbnails? thumbnails;
  final Localized? localized;
  final String? country;

  const Snippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json['title'] as String?,
        description: json['description'] as String?,
        customUrl: json['customUrl'] as String?,
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt'] as String),
        thumbnails: json['thumbnails'] == null
            ? null
            : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        localized: json['localized'] == null
            ? null
            : Localized.fromJson(json['localized'] as Map<String, dynamic>),
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'customUrl': customUrl,
        'publishedAt': publishedAt?.toIso8601String(),
        'thumbnails': thumbnails?.toJson(),
        'localized': localized?.toJson(),
        'country': country,
      };

  @override
  List<Object?> get props {
    return [
      title,
      description,
      customUrl,
      publishedAt,
      thumbnails,
      localized,
      country,
    ];
  }
}
