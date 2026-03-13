import 'package:flutter/material.dart';

enum PokedexNavItem { pokedex, regiones, favoritos, perfil }

class PokedexBottomNav extends StatelessWidget {
  final PokedexNavItem currentItem;
  final ValueChanged<PokedexNavItem> onItemSelected;

  const PokedexBottomNav({
    super.key,
    required this.currentItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Pokedex',
                isSelected: currentItem == PokedexNavItem.pokedex,
                onTap: () => onItemSelected(PokedexNavItem.pokedex),
              ),
              _NavItem(
                icon: Icons.public_rounded,
                label: 'Regiones',
                isSelected: currentItem == PokedexNavItem.regiones,
                onTap: () => onItemSelected(PokedexNavItem.regiones),
              ),
              _NavItem(
                icon: Icons.favorite_rounded,
                label: 'favoritos',
                isSelected: currentItem == PokedexNavItem.favoritos,
                onTap: () => onItemSelected(PokedexNavItem.favoritos),
              ),
              _NavItem(
                icon: Icons.person_rounded,
                label: 'Perfil',
                isSelected: currentItem == PokedexNavItem.perfil,
                onTap: () => onItemSelected(PokedexNavItem.perfil),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.onTap,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF3B82F6) : Colors.grey;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 26, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
