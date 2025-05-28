import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color color;
  final List<double> dashPattern;
  final double radius;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.strokeWidth = 2,
    this.color = TColors.borderPrimary,
    this.dashPattern = const [4, 3],
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: strokeWidth,
        color: color,
        dashPattern: dashPattern,
        radius: radius,
      ),
      child: child,
    );
  }
}
