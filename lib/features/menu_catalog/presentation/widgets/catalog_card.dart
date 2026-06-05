import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';

class CatalogCard extends StatelessWidget {
  final AlcoholEntity drink;
  final Color accentColor;
  final VoidCallback onRevealTap;

  const CatalogCard({
    super.key,
    required this.drink,
    required this.accentColor,
    required this.onRevealTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius2Xl),
      ),
      child: GlassContainer(
        padding: EdgeInsets.zero,
        borderRadius: AppSizes.radius2Xl,
        borderColor: const Color(0x1BFFFFFF),
        backgroundColor: const Color(0x11FFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius2Xl)),
                child: drink.thumbnailUrl != null
                    ? Image.network(
                        drink.thumbnailUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.black38,
                          child: Icon(Icons.local_bar, color: accentColor, size: 30.r),
                        ),
                      )
                    : Container(
                        color: Colors.black38,
                        child: Icon(Icons.local_bar, color: accentColor, size: 30.r),
                      ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.sm.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drink.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSizes.fontLg.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          drink.category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSizes.fontXs.sp,
                            color: accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onRevealTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor.withValues(alpha: 0.8),
                          padding: EdgeInsets.symmetric(vertical: AppSizes.xs.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                          ),
                        ),
                        child: Text(
                          'REVEAL',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontXs.sp,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
