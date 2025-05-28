import 'package:flutter/material.dart';

class IconTextButtonWidget extends StatelessWidget {
  final Widget? widget1;
  final Widget? widget2;
  final void Function()? onPressed;
  const IconTextButtonWidget({
    super.key,
    this.widget1,
    this.widget2,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(0),
        ),
      ),
      label: widget1 ?? SizedBox.shrink(),
      icon: widget2 ?? SizedBox.shrink(),
    );
  }
}
