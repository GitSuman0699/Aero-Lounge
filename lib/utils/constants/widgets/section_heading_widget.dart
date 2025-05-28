import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String title;
  const SectionHeadingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextTheme.of(context).bodyLarge?.copyWith(
            color: TColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
    );
  }
}
