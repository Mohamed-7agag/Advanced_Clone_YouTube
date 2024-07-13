import 'package:equatable/equatable.dart';

class Localized extends Equatable {
  final String? title;
  final String? description;

  const Localized({this.title, this.description});

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  @override
  List<Object?> get props => [title, description];
}
