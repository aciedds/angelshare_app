import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';

class RandomOutputCard extends StatelessWidget {
  final DrinkDetailEntity detail;
  final AppThemeColors themeColors;
  final VoidCallback onRevealFullBlueprintTap;

  const RandomOutputCard({
    super.key,
    required this.detail,
    required this.themeColors,
    required this.onRevealFullBlueprintTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.zero,
      borderRadius: AppSizes.radius3Xl,
      blur: 20.0,
      backgroundColor: themeColors.glassWhite,
      borderColor: themeColors.accent.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius3Xl)),
            child: detail.thumbnailUrl != null
                ? Image.network(
                    detail.thumbnailUrl!,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 180.h,
                    color: Colors.black26,
                    child: Icon(
                      Icons.local_bar_rounded,
                      color: themeColors.muted,
                      size: 48.r,
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSizes.xxl.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: themeColors.accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: themeColors.accent.withValues(alpha: 0.4)),
                      ),
                      child: Text(
                        detail.category.toUpperCase(),
                        style: TextStyle(
                          fontSize: AppSizes.fontXs.sp,
                          fontWeight: FontWeight.bold,
                          color: themeColors.accent,
                        ),
                      ),
                    ),
                    Text(
                      detail.alcoholic,
                      style: TextStyle(
                        fontSize: AppSizes.fontSm.sp,
                        color: themeColors.muted,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.md.h),
                NeonText(
                  text: detail.name,
                  glowColor: themeColors.primary,
                  style: TextStyle(
                    fontSize: AppSizes.font3Xl.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSizes.sm.h),
                Text(
                  'Instructions preview: ${detail.instructions}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppSizes.fontSm.sp,
                    color: const Color(0xFFE5E5E5),
                  ),
                ),
                SizedBox(height: AppSizes.xl.h),
                ElevatedButton.icon(
                  onPressed: onRevealFullBlueprintTap,
                  icon: Icon(Icons.chrome_reader_mode_rounded, color: Colors.black, size: 18.r),
                  label: Text(
                    'REVEAL FULL BLUEPRINT',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: AppSizes.fontSm.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColors.accent,
                    shadowColor: themeColors.accent,
                    elevation: 6,
                    padding: EdgeInsets.symmetric(vertical: AppSizes.md.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
