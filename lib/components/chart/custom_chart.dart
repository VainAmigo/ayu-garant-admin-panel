import 'dart:math' as math;
import 'package:flutter/material.dart';

class ChartSegment {
  final String label;
  final double value;
  final Color color;

  const ChartSegment({
    required this.label,
    required this.value,
    required this.color,
  });
}

class CustomChart extends StatelessWidget {
  final List<ChartSegment> segments;
  final double size;
  final double thickness;
  final double startAngle;

  const CustomChart({
    super.key,
    required this.segments,
    this.size = 200,
    this.thickness = 50,
    this.startAngle = -math.pi / 2,
  });

  @override
  Widget build(BuildContext context) {
    final double total = segments.fold(0, (sum, s) => sum + s.value);

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _DonutChartPainter(
            segments: segments,
            total: total == 0 ? 1 : total,
            thickness: thickness,
            startAngle: startAngle,
          ),
        ),
      ),
    );
  }
}


class _DonutChartPainter extends CustomPainter {
  final List<ChartSegment> segments;
  final double total;
  final double thickness;
  final double startAngle;

  _DonutChartPainter({
    required this.segments,
    required this.total,
    required this.thickness,
    required this.startAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - thickness) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..color = Colors.grey.withAlpha(10)
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, 0, 2 * math.pi, false, backgroundPaint);

    double angle = startAngle;
    for (final s in segments) {
      final sweep = (s.value / total) * 2 * math.pi;
      if (sweep <= 0) continue;

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.butt
        ..color = s.color;

      canvas.drawArc(rect, angle, sweep, false, paint);
      angle += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
