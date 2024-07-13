import 'package:equatable/equatable.dart';

class Medium extends Equatable {
  final String? url;
  final int? width;
  final int? height;

  const Medium({this.url, this.width, this.height});

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
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
