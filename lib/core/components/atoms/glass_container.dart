import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double? height;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 15.0,
    this.borderRadius = AppSizes.radius2Xl, // default standard 20
    this.backgroundColor = const Color(0x11FFFFFF),
    this.borderColor = const Color(0x22FFFFFF),
    this.padding = const EdgeInsets.all(AppSizes.lg), // default standard 16
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>();

    final Color effectiveBg = backgroundColor == const Color(0x11FFFFFF) && themeColors != null
        ? themeColors.glassWhite
        : backgroundColor;

    final Color effectiveBorder = borderColor == const Color(0x22FFFFFF) && themeColors != null
        ? themeColors.glassBorder
        : borderColor;

    final Color effectiveShadow = themeColors != null 
        ? themeColors.glassShadow 
        : AppTheme.glassShadow;

    final double effectiveRadius = borderRadius.r;

    // Resolve responsive padding
    EdgeInsetsGeometry effectivePadding = padding;
    if (padding is EdgeInsets) {
      final p = padding as EdgeInsets;
      effectivePadding = EdgeInsets.fromLTRB(p.left.w, p.top.h, p.right.w, p.bottom.h);
    }

    return Container(
      width: width?.w,
      height: height?.h,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(effectiveRadius),
        boxShadow: [
          BoxShadow(
            color: effectiveShadow,
            blurRadius: 24.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(effectiveRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: effectivePadding,
            decoration: BoxDecoration(
              color: effectiveBg,
              borderRadius: BorderRadius.circular(effectiveRadius),
              border: Border.all(
                color: effectiveBorder,
                width: 1.0.w,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
