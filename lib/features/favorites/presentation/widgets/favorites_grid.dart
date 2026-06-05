import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/favorites/favorites_provider.dart';

class FavoritesGrid extends StatelessWidget {
  final FavoritesState state;
  final AppThemeColors themeColors;
  final void Function(String drinkId, Color themeColor) onShowDetail;

  const FavoritesGrid({
    super.key,
    required this.state,
    required this.themeColors,
    required this.onShowDetail,
  });

  @override
  Widget build(BuildContext context) {
    if (state.favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_rounded,
              color: themeColors.muted.withValues(alpha: 0.5),
              size: 56.r,
            ),
            SizedBox(height: AppSizes.lg.h),
            Text(
              'No bookmark recipes archived.',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontLg.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.sm.h),
            Text(
              'Click the heart icon in the cocktail detail sheet to favorite.',
              style: TextStyle(color: const Color(0xFF8F88A3), fontSize: AppSizes.fontSm.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 100.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.lg.w,
        mainAxisSpacing: AppSizes.lg.h,
        childAspectRatio: 0.8,
      ),
      itemCount: state.favorites.length,
      itemBuilder: (context, index) {
        final drink = state.favorites[index];

        return GestureDetector(
          onTap: () {
            onShowDetail(drink.id, themeColors.primary);
          },
          child: GlassContainer(
            padding: EdgeInsets.zero,
            borderRadius: AppSizes.radius2Xl,
            blur: 15,
            backgroundColor: themeColors.glassWhite,
            borderColor: themeColors.glassBorder,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius2Xl.r)),
                    child: drink.thumbnailUrl != null
                        ? Image.network(
                            drink.thumbnailUrl!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.black38,
                            child: Icon(
                              Icons.local_bar_rounded,
                              color: themeColors.accent,
                              size: 40.r,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSizes.md.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drink.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppSizes.fontMd.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: AppSizes.xs.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              drink.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AppSizes.fontXs.sp,
                                color: themeColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: themeColors.muted,
                            size: 14.r,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
