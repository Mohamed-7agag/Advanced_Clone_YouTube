import 'package:advanced_youtube/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textStyle,
    required this.onPressed,
    this.width,
    required this.ok,
  });
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? width;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        fixedSize: width != null ? Size.fromWidth(width!) : null,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        backgroundColor: ok == true ? const Color(0xffEB3C04) : Colors.black,
        foregroundColor: Colors.white,
      ),
      child: Text(
        ok == true ? S.of(context).subscribed : S.of(context).subscribe,
        style: textStyle,
      ),
    );
  }
}
