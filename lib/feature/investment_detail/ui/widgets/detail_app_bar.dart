import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DetailAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => context.pop(),
        color: AppColors.textPrimary,
      ),
      title: Text(
        title,
        style: AppTypography.h5.copyWith(color: AppColors.textPrimary),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
          color: AppColors.textPrimary,
        ),
      ],
    );
  }
}
