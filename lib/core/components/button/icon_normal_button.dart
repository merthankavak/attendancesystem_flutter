import 'package:flutter/material.dart';

import 'normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  const IconNormalButton({Key? key, required this.icon, this.onPressed, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(child: Icon(icon, color: iconColor)),
    );
  }
}
