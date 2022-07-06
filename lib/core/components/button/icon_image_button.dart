import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconImageButton extends StatelessWidget {
  final String assetName;
  final Widget child;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  final VoidCallback? onPressed;

  const IconImageButton({
    Key? key,
    required this.assetName,
    required this.child,
    this.onPressed,
    this.style,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: style, onPressed: onPressed, icon: SvgPicture.asset(assetName), label: child);
  }
}
