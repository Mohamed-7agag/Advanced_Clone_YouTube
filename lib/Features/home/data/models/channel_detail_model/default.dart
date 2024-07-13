import 'package:equatable/equatable.dart';

class Default extends Equatable {
  final String? url;
  final int? width;
  final int? height;

  const Default({this.url, this.width, this.height});

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json['url'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };

  @override
  List<Object?> get props => [url, width, height];
}
