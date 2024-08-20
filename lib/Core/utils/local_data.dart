import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';



List<String> recommendationList (BuildContext context) {
  List<String> recommendation = [
  S.of(context).all,
  "Flutter",
  S.of(context).programming,
  S.of(context).food,
  S.of(context).sports,
  S.of(context).movies,
  S.of(context).entertainment,
  S.of(context).math,
  S.of(context).live,
  S.of(context).poadcasts
];

  return recommendation;
}