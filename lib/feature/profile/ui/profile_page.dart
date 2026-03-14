import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_breakpoints.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_header.dart';
import 'package:investment_fund/feature/profile/provider/profile_controller.dart';
import 'package:investment_fund/feature/profile/ui/widgets/custom_small_card_item.dart';
import 'package:investment_fund/feature/profile/ui/widgets/profile_menu_item.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(profileControllerProvider.notifier).initPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CustomHeader(
            children: [
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Perfil',
                  style: AppTypography.h4.copyWith(color: AppColors.background),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.background,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Usuario',
                      style: AppTypography.h5.copyWith(
                        color: AppColors.background,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'usuario@email.com',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.background.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: ResponsiveContainer(
              child: Padding(
                padding: EdgeInsets.all(
                  AppBreakpoints.horizontalPadding(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      CustomSmallCardItem(
                        title: 'Depositar',
                        icon: Icons.arrow_circle_up,
                        color: AppColors.success.withValues(alpha: 0.5),
                      ),
                      CustomSmallCardItem(
                        title: 'Retirar',
                        icon: Icons.arrow_circle_down,
                        color: AppColors.error.withValues(alpha: 0.5),
                      ),
                      CustomSmallCardItem(
                        title: 'Soporte',
                        icon: Icons.call,
                        color: AppColors.info.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  CustomCard(
                    children: [
                      Text(
                        'Cuenta',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ProfileMenuItem(
                        title: 'Información personal',
                        icon: Icons.person_outline,
                        subtitle: 'Editar nombre y datos',
                        onTap: () {},
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ProfileMenuItem(
                        title: 'Seguridad',
                        icon: Icons.lock_outline,
                        subtitle: 'Contraseña y verificación',
                        onTap: () {},
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ProfileMenuItem(
                        title: 'Métodos de pago',
                        icon: Icons.credit_card,
                        subtitle: 'Tarjetas y cuentas bancarias',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg),
                  CustomCard(
                    children: [
                      Text(
                        'Preferencias',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ProfileMenuItem(
                        title: 'Notificaciones',
                        icon: Icons.notifications_outlined,
                        subtitle: 'Alertas y recordatorios',
                        onTap: () {},
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ProfileMenuItem(
                        title: 'Idioma',
                        icon: Icons.language,
                        subtitle: 'Español',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg),
                  CustomCard(
                    children: [
                      ProfileMenuItem(
                        title: 'Cerrar sesión',
                        icon: Icons.logout,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
