import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';

class ListCard extends StatelessWidget {
  final AlcoholEntity drink;
  final Color accentColor;
  final AppThemeColors themeColors;
  final VoidCallback onArrowTap;

  const ListCard({
    super.key,
    required this.drink,
    required this.accentColor,
    required this.themeColors,
    required this.onArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.all(AppSizes.md.w),
      borderRadius: AppSizes.radiusXl,
      backgroundColor: themeColors.glassWhite,
      borderColor: themeColors.glassBorder,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            child: drink.thumbnailUrl != null
                ? Image.network(
                    drink.thumbnailUrl!,
                    width: 70.w,
                    height: 70.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 70.w,
                      height: 70.w,
                      color: Colors.black38,
                      child: Icon(Icons.local_bar, color: accentColor, size: 24.r),
                    ),
                  )
                : Container(
                    width: 70.w,
                    height: 70.w,
                    color: Colors.black38,
                    child: Icon(Icons.local_bar, color: accentColor, size: 24.r),
                  ),
          ),
          SizedBox(width: AppSizes.md.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${drink.id}',
                  style: TextStyle(fontSize: AppSizes.fontXs.sp, color: accentColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Text(
                  drink.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: AppSizes.fontLg.sp, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Text(
                  drink.category,
                  style: TextStyle(fontSize: AppSizes.fontSm.sp, color: Colors.white54),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded, color: accentColor, size: 18.r),
            onPressed: onArrowTap,
          ),
        ],
      ),
    );
  }
}
