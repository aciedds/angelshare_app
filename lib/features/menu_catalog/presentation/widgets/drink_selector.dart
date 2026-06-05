import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';

class DrinkSelector extends StatelessWidget {
  final ScrollController controller;
  final PageController pageController;
  final ValueNotifier<int> currentPage;
  final List<AlcoholEntity> filteredCocktails;
  final Color activeColor;

  const DrinkSelector({
    super.key,
    required this.controller,
    required this.pageController,
    required this.currentPage,
    required this.filteredCocktails,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.xxl.w),
        itemCount: filteredCocktails.length,
        itemBuilder: (context, index) {
          final drink = filteredCocktails[index];
          final isActive = index == currentPage.value;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.xs.w),
            child: GestureDetector(
              onTap: () {
                currentPage.value = index;
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: isActive ? 60.w : 52.w,
                    height: isActive ? 60.w : 52.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? activeColor : const Color(0x26FFFFFF),
                        width: isActive ? 2.0 : 1.0,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: activeColor.withValues(alpha: 0.6),
                                blurRadius: 10.r,
                                spreadRadius: 1.r,
                              )
                            ]
                          : null,
                    ),
                    child: ClipOval(
                      child: drink.thumbnailUrl != null
                          ? Image.network(
                              drink.thumbnailUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.black38,
                                child: Icon(Icons.local_bar_rounded, color: activeColor, size: 20.r),
                              ),
                            )
                          : Container(
                              color: Colors.black38,
                              child: Icon(Icons.local_bar_rounded, color: activeColor, size: 20.r),
                            ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 65.w,
                    child: Text(
                      drink.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppSizes.fontXs.sp,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? Colors.white : const Color(0xFF8F88A3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
