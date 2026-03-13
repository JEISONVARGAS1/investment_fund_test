import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      unselectedItemColor: AppColors.primary,
      selectedItemColor: AppColors.primaryDark,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryDark),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stocks'),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Noticias',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
