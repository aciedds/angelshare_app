import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/skeleton.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/gallery_card.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/catalog_card.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/list_card.dart';

class CocktailCatalog extends StatelessWidget {
  final MenuCatalogState state;
  final bool isLoading;
  final String? errorMessage;
  final MenuCatalogNotifier notifier;
  final PageController pageController;
  final ScrollController bottomScrollController;
  final ValueNotifier<int> currentPage;
  final List<AlcoholEntity> filteredCocktails;
  final Color accentColor;
  final AppThemeColors themeColors;
  final String layoutMode;
  final void Function(String drinkId, Color themeColor) onShowDetail;

  const CocktailCatalog({
    super.key,
    required this.state,
    required this.isLoading,
    required this.errorMessage,
    required this.notifier,
    required this.pageController,
    required this.bottomScrollController,
    required this.currentPage,
    required this.filteredCocktails,
    required this.accentColor,
    required this.themeColors,
    required this.layoutMode,
    required this.onShowDetail,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Skeleton(
                width: 270.w,
                height: 350.h,
                borderRadius: AppSizes.radius3Xl,
              ),
              SizedBox(height: AppSizes.xxl.h),
              Skeleton(
                width: 200.w,
                height: 20.h,
                borderRadius: AppSizes.radiusSm,
              ),
            ],
          ),
        ),
      );
    }

    if (errorMessage != null) {
      return Expanded(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.xxl.w),
            child: GlassContainer(
              backgroundColor: const Color(0x22FF0000),
              borderColor: Colors.redAccent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 40.r),
                  SizedBox(height: AppSizes.sm.h),
                  Text(
                    errorMessage ?? '',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSizes.md.h),
                  ElevatedButton(
                    onPressed: () => notifier.init(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                    ),
                    child: const Text('Try Again'),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (filteredCocktails.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'No holographic recipes match your search.',
            style: TextStyle(color: Color(0xFF8F88A3)),
          ),
        ),
      );
    }

    switch (layoutMode) {
      case 'grid_2':
        return Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppSizes.xxl.w,
              right: AppSizes.xxl.w,
              bottom: 100.h, // bottom spacer clearance
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSizes.md.w,
              mainAxisSpacing: AppSizes.md.h,
              childAspectRatio: 0.65,
            ),
            itemCount: filteredCocktails.length,
            itemBuilder: (context, index) {
              final drink = filteredCocktails[index];
              return CatalogCard(
                drink: drink,
                accentColor: accentColor,
                onRevealTap: () => onShowDetail(drink.id, accentColor),
              );
            },
          ),
        );

      case 'list_1':
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppSizes.xxl.w,
              right: AppSizes.xxl.w,
              bottom: 100.h,
            ),
            itemCount: filteredCocktails.length,
            itemBuilder: (context, index) {
              final drink = filteredCocktails[index];
              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.md.h),
                child: ListCard(
                  drink: drink,
                  accentColor: accentColor,
                  themeColors: themeColors,
                  onArrowTap: () => onShowDetail(drink.id, accentColor),
                ),
              );
            },
          ),
        );

      case 'carousel':
      default:
        return Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: filteredCocktails.length,
            onPageChanged: (index) {
              currentPage.value = index;
              if (bottomScrollController.hasClients) {
                final screenWidth = MediaQuery.of(context).size.width;
                final itemWidth = 65.w;
                final spacing = 12.w;
                final target = (index * (itemWidth + spacing)) - (screenWidth / 2) + (itemWidth / 2);
                bottomScrollController.animateTo(
                  target.clamp(0.0, bottomScrollController.position.maxScrollExtent),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            itemBuilder: (context, index) {
              final drink = filteredCocktails[index];
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  double pageOffset = 0.0;
                  if (pageController.position.haveDimensions) {
                    pageOffset = pageController.page! - index;
                  } else {
                    pageOffset = (currentPage.value - index).toDouble();
                  }

                  final absOffset = pageOffset.abs();
                  final double scale = (1.0 - (absOffset * 0.15)).clamp(0.85, 1.0);
                  final double translateY = absOffset * 25.0.h;
                  final double rotateZ = -pageOffset * 0.06;
                  final double rotateY = pageOffset * 0.12;
                  final double opacity = (1.0 - (absOffset * 0.4)).clamp(0.5, 1.0);
                  final double selectionLevel = (1.0 - absOffset).clamp(0.0, 1.0);

                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(0.0, translateY, 0.0)
                      ..rotateY(rotateY)
                      ..rotateZ(rotateZ)
                      ..scale(scale),
                    alignment: Alignment.center,
                    child: Center(
                      child: Opacity(
                        opacity: opacity,
                        child: SizedBox(
                          height: 400.h,
                          width: 300.w,
                          child: GalleryCard(
                            drink: drink,
                            selectionLevel: selectionLevel,
                            accentColor: accentColor,
                            onRevealFormulaTap: () {
                              if (selectionLevel > 0.8) {
                                onShowDetail(drink.id, accentColor);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
    }
  }
}
