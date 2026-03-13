import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';

enum PokemonType {
  grass(
    key: 'grass',
    icon: Icons.eco,
    displayName: 'Planta',
    color: AppColors.pokemonGrass,
    borderColor: AppColors.pokemonGrassBorder,
  ),
  poison(
    key: 'poison',
    icon: Icons.science,
    displayName: 'Veneno',
    color: AppColors.pokemonPoison,
    borderColor: AppColors.pokemonPoisonBorder,
  ),
  fire(
    key: 'fire',
    icon: Icons.local_fire_department,
    displayName: 'Fuego',
    color: AppColors.pokemonFire,
    borderColor: AppColors.pokemonFireBorder,
  ),
  flying(
    key: 'flying',
    icon: Icons.flutter_dash,
    displayName: 'Volador',
    color: AppColors.pokemonFlying,
    borderColor: AppColors.pokemonFlyingBorder,
  ),
  water(
    key: 'water',
    icon: Icons.water_drop,
    displayName: 'Agua',
    color: AppColors.pokemonWater,
    borderColor: AppColors.pokemonWaterBorder,
  ),
  bug(
    key: 'bug',
    icon: Icons.bug_report,
    displayName: 'Bicho',
    color: AppColors.pokemonBug,
    borderColor: AppColors.pokemonBugBorder,
  ),
  normal(
    key: 'normal',
    icon: Icons.pets,
    displayName: 'Normal',
    color: AppColors.pokemonNormal,
    borderColor: AppColors.pokemonNormalBorder,
  ),
  electric(
    key: 'electric',
    icon: Icons.bolt,
    displayName: 'Eléctrico',
    color: AppColors.pokemonElectric,
    borderColor: AppColors.pokemonElectricBorder,
  ),
  ground(
    key: 'ground',
    icon: Icons.terrain,
    displayName: 'Tierra',
    color: AppColors.pokemonGround,
    borderColor: AppColors.pokemonGroundBorder,
  ),
  fairy(
    key: 'fairy',
    icon: Icons.auto_awesome,
    displayName: 'Hada',
    color: AppColors.pokemonFairy,
    borderColor: AppColors.pokemonFairyBorder,
  ),
  fighting(
    key: 'fighting',
    icon: Icons.sports_mma,
    displayName: 'Lucha',
    color: AppColors.pokemonFighting,
    borderColor: AppColors.pokemonFightingBorder,
  ),
  psychic(
    key: 'psychic',
    icon: Icons.psychology,
    displayName: 'Psíquico',
    color: AppColors.pokemonPsychic,
    borderColor: AppColors.pokemonPsychicBorder,
  ),
  rock(
    key: 'rock',
    icon: Icons.landscape,
    displayName: 'Roca',
    color: AppColors.pokemonRock,
    borderColor: AppColors.pokemonRockBorder,
  ),
  steel(
    key: 'steel',
    icon: Icons.build,
    displayName: 'Acero',
    color: AppColors.pokemonSteel,
    borderColor: AppColors.pokemonSteelBorder,
  ),
  ice(
    key: 'ice',
    icon: Icons.ac_unit,
    displayName: 'Hielo',
    color: AppColors.pokemonIce,
    borderColor: AppColors.pokemonIceBorder,
  ),
  ghost(
    key: 'ghost',
    icon: Icons.visibility_off,
    displayName: 'Fantasma',
    color: AppColors.pokemonGhost,
    borderColor: AppColors.pokemonGhostBorder,
  ),
  dragon(
    key: 'dragon',
    icon: Icons.park,
    displayName: 'Dragón',
    color: AppColors.pokemonDragon,
    borderColor: AppColors.pokemonDragonBorder,
  ),
  dark(
    key: 'dark',
    icon: Icons.dark_mode,
    displayName: 'Siniestro',
    color: AppColors.pokemonDark,
    borderColor: AppColors.pokemonDarkBorder,
  );

  final String key;
  final Color color;
  final IconData icon;
  final String displayName;
  final Color borderColor;

  const PokemonType({
    required this.key,
    required this.icon,
    required this.color,
    required this.displayName,
    required this.borderColor,
  });

  static PokemonType? fromString(String key) {
    for (final type in PokemonType.values) {
      if (type.name == key) return type;
    }
    return null;
  }
}
