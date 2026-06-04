import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/features/favorites/favorites_provider.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_sheet.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_skeleton.dart';

class FavoritesTab extends HookConsumerWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesNotifierProvider);
    final cartState = ref.watch(cartNotifierProvider);

    // Toggle sub-tab: 0 for Favorites, 1 for History
    final subTabIndex = useState(0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const NeonText(
            text: 'MYSTIC ARCHIVE',
            glowColor: AppTheme.goldMuted,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Saved blueprints and logs of previously compiled formulas.',
            style: TextStyle(color: Color(0xFFA59EBF), fontSize: 13),
          ),
          const SizedBox(height: 20),

          // Sliding Toggle Header
          Row(
            children: [
              Expanded(
                child: _toggleTabButton(
                  title: 'FAVORITES',
                  isSelected: subTabIndex.value == 0,
                  onTap: () => subTabIndex.value = 0,
                  activeColor: AppTheme.goldPrimary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _toggleTabButton(
                  title: 'HISTORY',
                  isSelected: subTabIndex.value == 1,
                  onTap: () => subTabIndex.value = 1,
                  activeColor: AppTheme.goldMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Sub-Tab Content
          Expanded(
            child: IndexedStack(
              index: subTabIndex.value,
              children: [
                // 1. Favorites view
                _buildFavoritesGrid(context: context, ref: ref, state: favoritesState),
                // 2. Past orders history view
                _buildHistoryList(context: context, ref: ref, state: cartState),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required Color activeColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(vertical: 10),
        borderRadius: 14,
        blur: 5.0,
        backgroundColor: isSelected ? activeColor.withValues(alpha: 0.25) : const Color(0x0CFFFFFF),
        borderColor: isSelected ? activeColor : const Color(0x1BFFFFFF),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFA59EBF),
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid({
    required BuildContext context,
    required WidgetRef ref,
    required FavoritesState state,
  }) {
    if (state.favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_rounded,
              color: AppTheme.goldMuted.withValues(alpha: 0.5),
              size: 56,
            ),
            const SizedBox(height: 16),
            const Text(
              'No bookmark recipes archived.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Click the heart icon in the cocktail detail sheet to favorite.',
              style: TextStyle(color: Color(0xFF8F88A3), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.8,
      ),
      itemCount: state.favorites.length,
      itemBuilder: (context, index) {
        final drink = state.favorites[index];

        return GestureDetector(
          onTap: () {
            _showCocktailDetail(context: context, ref: ref, drinkId: drink.id);
          },
          child: GlassContainer(
            padding: EdgeInsets.zero,
            borderRadius: 20,
            blur: 15,
            backgroundColor: const Color(0x13FFFFFF),
            borderColor: const Color(0x1BFFFFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: drink.thumbnailUrl != null
                        ? Image.network(
                            drink.thumbnailUrl!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.black38,
                            child: const Icon(
                              Icons.local_bar_rounded,
                              color: AppTheme.goldAccent,
                              size: 40,
                            ),
                          ),
                  ),
                ),
                
                // Info Title
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drink.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            drink.category,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: AppTheme.goldAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.favorite_rounded,
                            color: AppTheme.goldMuted,
                            size: 14,
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

  Widget _buildHistoryList({
    required BuildContext context,
    required WidgetRef ref,
    required CartState state,
  }) {
    if (state.orderHistory.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              color: AppTheme.goldAccent.withValues(alpha: 0.5),
              size: 56,
            ),
            const SizedBox(height: 16),
            const Text(
              'No checkout logs compiled.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Replicate queued drinks to compile order history records.',
              style: TextStyle(color: Color(0xFF8F88A3), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 100),
      itemCount: state.orderHistory.length,
      itemBuilder: (context, index) {
        final log = state.orderHistory[index];
        final timeStr = "${log.orderedAt.day}/${log.orderedAt.month} ${log.orderedAt.hour.toString().padLeft(2, '0')}:${log.orderedAt.minute.toString().padLeft(2, '0')}";

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GlassContainer(
            padding: const EdgeInsets.all(12),
            borderRadius: 16,
            backgroundColor: const Color(0x0CFFFFFF),
            borderColor: const Color(0x1BFFFFFF),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: log.thumbnailUrl != null
                      ? Image.network(
                          log.thumbnailUrl!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 55,
                          height: 55,
                          color: Colors.black26,
                          child: const Icon(Icons.local_bar, color: AppTheme.goldAccent),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quantity: ${log.quantity}x  |  $timeStr',
                        style: const TextStyle(
                          color: Color(0xFFA59EBF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.repeat_rounded, color: AppTheme.goldAccent),
                  onPressed: () async {
                    // Quick add to cart
                    await ref.read(cartNotifierProvider.notifier).addToCart(
                          idDrink: log.idDrink,
                          name: log.name,
                          price: 25, // default premium price in cyber-mana
                          thumbnailUrl: log.thumbnailUrl,
                          quantity: log.quantity,
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${log.quantity}x ${log.name} back to replicator cart!'),
                          backgroundColor: AppTheme.backgroundDeep,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCocktailDetail({
    required BuildContext context,
    required WidgetRef ref,
    required String drinkId,
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
              final sheetState = ref.watch(menuCatalogNotifierProvider);
              if (sheetState.isLoadingDetail) {
                return const DrinkDetailSkeleton();
              }
              if (sheetState.selectedDrinkDetail == null) {
                return Center(
                  child: Text(
                    sheetState.errorMessage ?? 'Failed to load formula',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }
              return DrinkDetailSheet(drink: sheetState.selectedDrinkDetail!);
            },
          ),
        );
      },
    );
  }
}
