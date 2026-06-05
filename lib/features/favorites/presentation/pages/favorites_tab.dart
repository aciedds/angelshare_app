import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/features/favorites/favorites_provider.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_sheet.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_skeleton.dart';
import 'package:angelshare_app/features/favorites/presentation/widgets/toggle_tab_button.dart';
import 'package:angelshare_app/features/favorites/presentation/widgets/favorites_grid.dart';
import 'package:angelshare_app/features/favorites/presentation/widgets/history_list.dart';
import 'package:angelshare_app/core/providers/view_state.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';

class FavoritesTab extends HookConsumerWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(favoritesNotifierProvider);
    final favoritesState = viewState.data ?? const FavoritesState();

    final cartViewState = ref.watch(cartNotifierProvider);
    final cartState = cartViewState.data ?? const CartState();

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

    // Toggle sub-tab: 0 for Favorites, 1 for History
    final subTabIndex = useState(0);

    if (viewState is ViewStateLoading<FavoritesState> && favoritesState.favorites.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: themeColors.primary),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xxl.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSizes.lg.h),
          NeonText(
            text: 'MYSTIC ARCHIVE',
            glowColor: themeColors.muted,
            style: TextStyle(
              fontSize: AppSizes.font3Xl.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: AppSizes.sm.h),
          Text(
            'Saved blueprints and logs of previously compiled formulas.',
            style: TextStyle(color: const Color(0xFFA59EBF), fontSize: AppSizes.fontSm.sp),
          ),
          SizedBox(height: AppSizes.xl.h),

          // Sliding Toggle Header
          Row(
            children: [
              Expanded(
                child: ToggleTabButton(
                  title: 'FAVORITES',
                  isSelected: subTabIndex.value == 0,
                  onTap: () => subTabIndex.value = 0,
                  activeColor: themeColors.primary,
                  themeColors: themeColors,
                ),
              ),
              SizedBox(width: AppSizes.md.w),
              Expanded(
                child: ToggleTabButton(
                  title: 'HISTORY',
                  isSelected: subTabIndex.value == 1,
                  onTap: () => subTabIndex.value = 1,
                  activeColor: themeColors.muted,
                  themeColors: themeColors,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.xl.h),

          // Sub-Tab Content
          Expanded(
            child: IndexedStack(
              index: subTabIndex.value,
              children: [
                FavoritesGrid(
                  state: favoritesState,
                  themeColors: themeColors,
                  onShowDetail: (drinkId, themeColor) {
                    _showCocktailDetail(context: context, ref: ref, drinkId: drinkId, themeColor: themeColor);
                  },
                ),
                HistoryList(
                  state: cartState,
                  themeColors: themeColors,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _showCocktailDetail({
    required BuildContext context,
    required WidgetRef ref,
    required String drinkId,
    required Color themeColor,
  }) {
    ref.read(menuCatalogNotifierProvider.notifier).fetchDetail(id: drinkId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Consumer(
            builder: (context, ref, child) {
              final viewState = ref.watch(menuCatalogNotifierProvider);
              final sheetState = viewState.data ?? const MenuCatalogState();
              final isLoading = sheetState.isLoadingDetail || viewState is ViewStateLoading<MenuCatalogState>;
              if (isLoading) {
                return const DrinkDetailSkeleton();
              }
              final drinkDetail = sheetState.selectedDrinkDetail;
              if (drinkDetail == null) {
                final errorMessage = viewState.maybeWhen(
                  error: (message, _) => message,
                  orElse: () => null,
                );
                return Center(
                  child: Text(
                    errorMessage ?? 'Failed to load formula',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }
              return DrinkDetailSheet(drink: drinkDetail);
            },
          ),
        );
      },
    );
  }
}
