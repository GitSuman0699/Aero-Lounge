import 'package:flutter/material.dart';

class SectionHeadingRow extends StatelessWidget {
  final Widget? widget1;
  final Widget? widget2;
  const SectionHeadingRow({
    super.key,
    this.widget1,
    this.widget2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget1 ?? SizedBox.shrink(),
        widget2 ?? SizedBox.shrink(),
      ],
    );
  }
}
