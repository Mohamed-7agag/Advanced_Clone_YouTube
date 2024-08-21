import 'package:advanced_youtube/generated/l10n.dart';

import '../utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).somethingWrong,
        style: Styles.textStyle16,
      ),
    );
  }
}
