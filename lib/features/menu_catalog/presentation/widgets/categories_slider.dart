import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/skeleton.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';

class CategoriesSlider extends StatelessWidget {
  final MenuCatalogState state;
  final bool isLoading;
  final MenuCatalogNotifier notifier;
  final ScrollController controller;
  final Color activeColor;
  final AppThemeColors themeColors;

  const CategoriesSlider({
    super.key,
    required this.state,
    required this.isLoading,
    required this.notifier,
    required this.controller,
    required this.activeColor,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: isLoading && state.categories.isEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSizes.lg.w),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.sm.w),
                  child: Skeleton(
                    width: 100.w,
                    height: 40.h,
                    borderRadius: AppSizes.radiusLg,
                  ),
                );
              },
            )
          : ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSizes.lg.w),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                final isSelected = state.selectedCategory == category;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.sm.w),
                  child: GestureDetector(
                    onTap: () => notifier.selectCategory(category: category),
                    child: GlassContainer(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.xl.w, vertical: AppSizes.sm.h),
                      borderRadius: AppSizes.radiusLg,
                      blur: 5.0,
                      backgroundColor: isSelected ? activeColor.withValues(alpha: 0.25) : themeColors.glassWhite,
                      borderColor: isSelected ? activeColor : themeColors.glassBorder,
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : const Color(0xFFA0A0A0),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: AppSizes.fontMd.sp,
                            shadows: isSelected
                                ? [
                                    Shadow(
                                      color: activeColor,
                                      blurRadius: 8.r,
                                    )
                                  ]
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
