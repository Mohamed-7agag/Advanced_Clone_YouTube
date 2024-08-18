import 'package:advanced_youtube/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem(
      {super.key, required this.text, required this.icon, this.onTap});
  final String text;
  final Icon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.grey[200],
            child: icon,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
