import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';

class GalleryCard extends StatelessWidget {
  final AlcoholEntity drink;
  final double selectionLevel;
  final Color accentColor;
  final VoidCallback onRevealFormulaTap;

  const GalleryCard({
    super.key,
    required this.drink,
    required this.selectionLevel,
    required this.accentColor,
    required this.onRevealFormulaTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius3Xl),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.3 * selectionLevel),
            blurRadius: 10.r + 15.r * selectionLevel,
            spreadRadius: 2.r * selectionLevel,
          ),
        ],
      ),
      child: GlassContainer(
        padding: EdgeInsets.zero,
        borderRadius: AppSizes.radius3Xl,
        borderColor: Color.lerp(const Color(0x1BFFFFFF), accentColor, selectionLevel) ?? const Color(0x1BFFFFFF),
        backgroundColor: Color.lerp(const Color(0x11FFFFFF), const Color(0x1AFFFFFF), selectionLevel) ?? const Color(0x11FFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius3Xl)),
                    child: drink.thumbnailUrl != null
                        ? Image.network(
                            drink.thumbnailUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.black38,
                              child: Icon(
                                Icons.local_bar_rounded,
                                color: accentColor.withValues(alpha: 0.6),
                                size: 50.r,
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.black38,
                            child: Icon(
                              Icons.local_bar_rounded,
                              color: accentColor,
                              size: 50.r,
                            ),
                          ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.8),
                          ],
                          stops: const [0.0, 0.3, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.xl.w, vertical: AppSizes.lg.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ${drink.id}',
                              style: TextStyle(
                                fontSize: AppSizes.fontXs.sp,
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Icon(
                              Icons.bolt_rounded,
                              color: accentColor,
                              size: 16.r,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          drink.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSizes.font2Xl.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Holographic Blueprint',
                          style: TextStyle(
                            fontSize: AppSizes.fontSm.sp,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onRevealFormulaTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.lerp(
                            accentColor.withValues(alpha: 0.3),
                            accentColor,
                            selectionLevel,
                          ),
                          shadowColor: Color.lerp(
                            Colors.transparent,
                            accentColor,
                            selectionLevel,
                          ) ?? Colors.transparent,
                          elevation: 6.0 * selectionLevel,
                          padding: EdgeInsets.symmetric(vertical: AppSizes.md.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                            side: BorderSide(
                              color: Color.lerp(
                                const Color(0x33FFFFFF),
                                Colors.transparent,
                                selectionLevel,
                              ) ?? Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'REVEAL FORMULA',
                          style: TextStyle(
                            color: Color.lerp(
                              Colors.white70,
                              Colors.black,
                              selectionLevel,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontSm.sp,
                            letterSpacing: 1.5,
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
