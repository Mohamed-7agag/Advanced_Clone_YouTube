import 'package:equatable/equatable.dart';

import 'statistics.dart';

class VideoStatisticsModel extends Equatable {
  final String? kind;
  final String? etag;
  final String? id;
  final Statistics? statistics;

  const VideoStatisticsModel({this.kind, this.etag, this.id, this.statistics});

  factory VideoStatisticsModel.fromJson(Map<String, dynamic> json) {
    return VideoStatisticsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] as String?,
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'statistics': statistics?.toJson(),
      };

  @override
  List<Object?> get props => [kind, etag, id, statistics];
}
