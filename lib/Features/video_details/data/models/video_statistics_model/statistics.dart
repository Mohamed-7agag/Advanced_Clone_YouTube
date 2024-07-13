import 'package:equatable/equatable.dart';

class Statistics extends Equatable {
  final String? viewCount;
  final String? likeCount;
  final String? favoriteCount;
  final String? commentCount;

  const Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json['viewCount'] as String?,
        likeCount: json['likeCount'] as String?,
        favoriteCount: json['favoriteCount'] as String?,
        commentCount: json['commentCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'viewCount': viewCount,
        'likeCount': likeCount,
        'favoriteCount': favoriteCount,
        'commentCount': commentCount,
      };

  @override
  List<Object?> get props {
    return [
      viewCount,
      likeCount,
      favoriteCount,
      commentCount,
    ];
  }
}
