import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const IconTextButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.onPressed,
      this.style,
      this.iconColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: style,
        onPressed: onPressed,
        icon: Center(child: Icon(icon, color: iconColor)),
        label: Center(child: Text(text, style: textStyle)));
  }
}
