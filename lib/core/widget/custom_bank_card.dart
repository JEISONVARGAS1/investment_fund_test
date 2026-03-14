import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomBankCard extends StatelessWidget {
  final String number;

  const CustomBankCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .all(AppSpacing.lg),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 2,
            offset: Offset(0, 8),
            color: AppColors.textTertiary.withValues(alpha: 0.4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: .circular(AppSpacing.radiusXl),
        child: Container(
          constraints: BoxConstraints(maxWidth: 420, minHeight: 240),
          decoration: BoxDecoration(
            borderRadius: .circular(AppSpacing.radiusXl),
            boxShadow: [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: -4,
                offset: Offset(0, 12),
                color: AppColors.primaryDark.withValues(alpha: 0.4),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: .circular(AppSpacing.radiusXl),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDark,
                      AppColors.secondaryDark,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
              Positioned(
                top: -60,
                right: -60,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                left: -40,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: AppColors.primary.withValues(alpha: 0.15),
                  ),
                ),
              ),
              Padding(
                padding: .all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        _chipPattern(),
                        Icon(
                          Icons.wifi,
                          color: Colors.white.withValues(alpha: 0.6),
                          size: 28,
                        ),
                      ],
                    ),

                    SizedBox(height: AppSpacing.md),
                    // Información de la cuenta
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .end,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Broker account',
                              style: AppTypography.caption.copyWith(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$ $number',
                              style: AppTypography.h2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  size: 16,
                                  color: AppColors.success,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '+\$800.14 (10%)',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: .end,
                          children: [
                            Text(
                              'Investment',
                              style: AppTypography.caption.copyWith(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'VALID',
                              style: AppTypography.caption.copyWith(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _chipPattern() {
  return Container(
    width: 48,
    height: 36,
    decoration: BoxDecoration(
      borderRadius: .circular(AppSpacing.radiusXs),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE8D5A3), Color(0xFFD4AF37), Color(0xFFB8860B)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: .circular(AppSpacing.radiusXs),
      child: CustomPaint(painter: ChipPatternPainter()),
    ),
  );
}

class ChipPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 3; j++) {
        canvas.drawRect(
          Rect.fromLTWH(
            size.width * 0.15 + i * size.width * 0.2,
            size.height * 0.2 + j * size.height * 0.25,
            size.width * 0.15,
            size.height * 0.15,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
