import 'package:equatable/equatable.dart';

import 'snippet.dart';
import 'statistics.dart';

class ChannelDetailModel extends Equatable {
  final String? kind;
  final String? etag;
  final String? id;
  final Snippet? snippet;
  final Statistics? statistics;

  const ChannelDetailModel({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.statistics,
  });

  factory ChannelDetailModel.fromJson(Map<String, dynamic> json) {
    return ChannelDetailModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] as String?,
      snippet: json['snippet'] == null
          ? null
          : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
        'statistics': statistics?.toJson(),
      };

  @override
  List<Object?> get props => [kind, etag, id, snippet, statistics];
}
