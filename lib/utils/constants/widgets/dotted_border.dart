import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final List<double> dashPattern;
  final double radius;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.color,
    required this.dashPattern,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final outer = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(outer, Radius.circular(radius));

    // Create a path for the dashed border
    final path = Path()..addRRect(rrect);

    // Calculate the total length of the path
    final metrics = path.computeMetrics();
    final totalLength = metrics.fold(0.0, (sum, metric) => sum + metric.length);

    // Draw dashed line along the path
    var currentLength = 0.0;
    var draw = true;
    while (currentLength < totalLength) {
      final len = dashPattern[draw ? 0 : 1];
      final nextLength = currentLength + len;

      if (draw) {
        for (final metric in path.computeMetrics()) {
          if (currentLength < metric.length) {
            final extractPath = metric.extractPath(
                currentLength, nextLength.clamp(0.0, metric.length));
            canvas.drawPath(extractPath, paint);
            break;
          }
        }
      }

      currentLength = nextLength;
      draw = !draw;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
