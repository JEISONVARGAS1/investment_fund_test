import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomSearch extends StatefulWidget {
  final bool enabled;
  final bool autofocus;
  final String hintText;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;

  const CustomSearch({
    super.key,
    this.onClear,
    this.onChanged,
    this.controller,
    this.onSubmitted,
    this.enabled = true,
    this.autofocus = false,
    this.hintText = 'Buscar...',
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  late TextEditingController _controller;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.controller == null) _isInternalController = true;
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(CustomSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_onTextChanged);
      if (_isInternalController) _controller.dispose();
      _controller = widget.controller ?? TextEditingController();
      _isInternalController = widget.controller == null;
      _controller.addListener(_onTextChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (_isInternalController) _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      style: AppTypography.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: AppColors.textSecondary,
          size: 22,
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                onPressed: () {
                  _controller.clear();
                  widget.onChanged?.call('');
                  widget.onClear?.call();
                },
              )
            : null,
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: .symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 2,
        ),
        border: OutlineInputBorder(
          borderRadius: .circular(AppSpacing.radiusFull),
          borderSide: BorderSide(
            color: AppColors.textTertiary.withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(AppSpacing.radiusFull),
          borderSide: BorderSide(
            color: AppColors.textTertiary.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(AppSpacing.radiusFull),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(AppSpacing.radiusFull),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
