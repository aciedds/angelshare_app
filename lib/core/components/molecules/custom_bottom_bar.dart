import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';

bool get isMobileClient => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>() ??
        const AppThemeColors(
          backgroundObsidian: Colors.black,
          backgroundDeep: Colors.black87,
          primary: Colors.amber,
          accent: Colors.amberAccent,
          muted: Colors.grey,
          glassWhite: Colors.white10,
          glassBorder: Colors.white24,
          glassShadow: Colors.black38,
        );

    final List<_BottomBarItem> items;
    if (isMobileClient) {
      items = [
        _BottomBarItem(icon: Icons.local_bar_rounded, label: 'Menu'),
        _BottomBarItem(icon: Icons.favorite_rounded, label: 'Archive'),
        _BottomBarItem(icon: Icons.auto_awesome_rounded, label: 'Magical'),
      ];
    } else {
      items = [
        _BottomBarItem(icon: Icons.local_bar_rounded, label: 'Menu'),
        _BottomBarItem(icon: Icons.auto_awesome_rounded, label: 'Magical'),
      ];
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.xxl.w, 0, AppSizes.xxl.w, AppSizes.xxl.h),
      child: GlassContainer(
        borderRadius: AppSizes.radius3Xl, // standard 24
        padding: EdgeInsets.symmetric(vertical: AppSizes.sm.h, horizontal: AppSizes.lg.w),
        backgroundColor: themeColors.glassWhite,
        borderColor: themeColors.glassBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == currentIndex;
            
            final Color activeColor;
            if (isMobileClient) {
              activeColor = index == 0
                  ? themeColors.primary
                  : index == 1
                      ? themeColors.accent
                      : themeColors.accent;
            } else {
              activeColor = index == 0
                  ? themeColors.primary
                  : themeColors.accent;
            }

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.radiusSm.w + 6.w, vertical: AppSizes.sm.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radiusXl.r),
                  color: isSelected ? activeColor.withValues(alpha: 0.15) : Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? activeColor : const Color(0xFF8F88A3),
                      size: AppSizes.iconLg.r,
                      shadows: isSelected
                          ? [
                              Shadow(
                                color: activeColor,
                                blurRadius: 10.r,
                              )
                            ]
                          : null,
                    ),
                    SizedBox(height: AppSizes.xs.h),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: AppSizes.fontXs.sp,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : const Color(0xFF8F88A3),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final IconData icon;
  final String label;

  const _BottomBarItem({
    required this.icon,
    required this.label,
  });
}
