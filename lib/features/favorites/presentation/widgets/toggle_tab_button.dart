import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';

class ToggleTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;
  final AppThemeColors themeColors;

  const ToggleTabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.activeColor,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        padding: EdgeInsets.symmetric(vertical: AppSizes.sm.h),
        borderRadius: AppSizes.radiusLg,
        blur: 5.0,
        backgroundColor: isSelected ? activeColor.withValues(alpha: 0.25) : themeColors.glassWhite,
        borderColor: isSelected ? activeColor : themeColors.glassBorder,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFA59EBF),
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.fontSm.sp,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
