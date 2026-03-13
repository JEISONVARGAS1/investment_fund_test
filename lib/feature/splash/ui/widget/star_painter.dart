import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/start_data.dart';
import 'package:investment_fund/core/theme/app_colors.dart';

class StarsPainter extends CustomPainter {
  final Animation<double> animation;
  final List<StarData> stars;

  StarsPainter({required this.animation, required this.stars})
    : super(repaint: animation);

  void _drawStar(Canvas canvas, Offset center, double radius, Color color) {
    const int points = 5;
    const double innerRadiusRatio = 0.4;

    final path = Path();
    for (int i = 0; i < points * 2; i++) {
      final angle = -math.pi / 2 + (i * math.pi / points);
      final r = i.isEven ? radius : radius * innerRadiusRatio;
      final x = center.dx + math.cos(angle) * r;
      final y = center.dy + math.sin(angle) * r;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final t = (animation.value + star.phase) % 1.0;
      final scale = 0.5 + 0.5 * math.sin(t * 2 * math.pi);
      final currentSize = star.size * (0.6 + 0.8 * scale);
      final center = Offset(star.x * size.width, star.y * size.height);

      _drawStar(
        canvas,
        center,
        currentSize,
        AppColors.blueLight.withOpacity(0.6 + 0.4 * scale),
      );
    }
  }

  @override
  bool shouldRepaint(covariant StarsPainter oldDelegate) => true;
}
