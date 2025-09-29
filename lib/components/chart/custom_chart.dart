import 'dart:math' as math;
import 'package:ayu_admin_panel/themes/themes.dart';
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
  final bool isFinance;
  final String? totalPremium;

  const CustomChart({
    super.key,
    required this.segments,
    this.size = 200,
    this.thickness = 50,
    this.startAngle = -math.pi / 2,
    this.isFinance = false,
    this.totalPremium,
  });

  @override
  Widget build(BuildContext context) {
    final double total = segments.fold(0, (sum, s) => sum + s.value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
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
        ),
        const SizedBox(height: 20),
        isFinance ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              totalPremium ?? '',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Общая сумма',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ) : SizedBox.shrink(),
        const SizedBox(height: 20),
        ...segments.map((s) => _LegendRow(segment: s)),
      ],
    );
  }
}

class _LegendRow extends StatelessWidget {
  final ChartSegment segment;

  const _LegendRow({required this.segment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: segment.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              segment.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            _formatValue(segment.value),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: segment.color,
            ),
          ),
        ],
      ),
    );
  }

  String _formatValue(double v) {
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toStringAsFixed(1);
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
