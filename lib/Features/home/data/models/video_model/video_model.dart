import 'package:equatable/equatable.dart';

import 'id.dart';
import 'snippet.dart';

class VideoModel extends Equatable {
  final String? kind;
  final String? etag;
  final Id? id;
  final Snippet? snippet;

  const VideoModel({this.kind, this.etag, this.id, this.snippet});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        kind: json['kind'] as String?,
        etag: json['etag'] as String?,
        id: json['id'] == null
            ? null
            : Id.fromJson(json['id'] as Map<String, dynamic>),
        snippet: json['snippet'] == null
            ? null
            : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id?.toJson(),
        'snippet': snippet?.toJson(),
      };

  @override
  List<Object?> get props => [kind, etag, id, snippet];
}
