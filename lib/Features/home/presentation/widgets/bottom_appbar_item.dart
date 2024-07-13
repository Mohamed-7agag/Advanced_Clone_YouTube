import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({super.key, required this.text, required this.icon});
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: Column(
        children: [
          icon,
          Text(
            text,
            style: Styles.textStyle11.copyWith(
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
