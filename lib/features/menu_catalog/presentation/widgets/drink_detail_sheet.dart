import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/components/molecules/custom_bottom_bar.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/features/favorites/favorites_provider.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';

class DrinkDetailSheet extends ConsumerWidget {
  final DrinkDetailEntity drink;

  const DrinkDetailSheet({
    super.key,
    required this.drink,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch favorites to render dynamic heart icon state
    final isFavorite = ref.watch(favoritesNotifierProvider).favorites.any((f) => f.id == drink.id);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: GlassContainer(
        borderRadius: 32,
        padding: EdgeInsets.zero,
        blur: 25.0,
        backgroundColor: const Color(0x22050308),
        borderColor: AppTheme.goldAccent.withValues(alpha: 0.3),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pull Bar / Indicator
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Image & Basic Info Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        drink.thumbnailUrl != null
                            ? Image.network(
                                drink.thumbnailUrl!,
                                fit: BoxFit.cover,
                              )
                            : Container(color: Colors.black38),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color(0xCC07040E),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        
                        // Floating Favorite Heart Button (Mobile Only)
                        if (isMobileClient)
                          Positioned(
                            top: 16,
                            right: 16,
                            child: GestureDetector(
                              onTap: () {
                                ref.read(favoritesNotifierProvider.notifier).toggleFavorite(
                                      idDrink: drink.id,
                                      name: drink.name,
                                      category: drink.category,
                                      thumbnailUrl: drink.thumbnailUrl,
                                    );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black45,
                                  border: Border.all(
                                    color: isFavorite ? AppTheme.goldMuted : Colors.white30,
                                    width: 1.5,
                                  ),
                                  boxShadow: isFavorite
                                      ? [
                                          BoxShadow(
                                            color: AppTheme.goldMuted.withValues(alpha: 0.5),
                                            blurRadius: 10,
                                          )
                                        ]
                                      : null,
                                ),
                                child: Icon(
                                  isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                  color: isFavorite ? AppTheme.goldMuted : Colors.white70,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),

                        Positioned(
                          left: 16,
                          bottom: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.goldPrimary.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppTheme.goldPrimary),
                                ),
                                child: Text(
                                  drink.alcoholic.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              NeonText(
                                text: drink.name,
                                glowColor: AppTheme.goldAccent,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Category & Glass Specs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildSpecCard(
                        icon: Icons.category_rounded,
                        label: 'Category',
                        value: drink.category,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSpecCard(
                        icon: Icons.local_bar_rounded,
                        label: 'Serving Glass',
                        value: drink.glass,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Ingredients Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'INGREDIENTS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.goldAccent,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Ingredients List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: List.generate(drink.ingredients.length, (index) {
                    final ingredient = drink.ingredients[index];
                    final imageUrl =
                        'https://www.thecocktaildb.com/images/ingredients/${Uri.encodeComponent(ingredient.name)}-Small.png';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: GlassContainer(
                        padding: const EdgeInsets.all(10.0),
                        borderRadius: 16,
                        blur: 5,
                        backgroundColor: const Color(0x0CFFFFFF),
                        borderColor: const Color(0x1BFFFFFF),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                color: Colors.black26,
                                width: 44,
                                height: 44,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.eco_rounded,
                                      color: AppTheme.goldAccent,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                ingredient.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.goldPrimary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppTheme.goldPrimary.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                ingredient.measure.isNotEmpty
                                    ? ingredient.measure
                                    : 'To taste',
                                style: const TextStyle(
                                  color: Color(0xFFD1CBE5),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // Instructions
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'INSTRUCTIONS & FORMULA',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.goldMuted,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GlassContainer(
                  padding: const EdgeInsets.all(16.0),
                  borderRadius: 20,
                  backgroundColor: const Color(0x11FFFFFF),
                  child: Text(
                    drink.instructions,
                    style: const TextStyle(
                      color: Color(0xFFD1CBE5),
                      height: 1.6,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Replicator Action Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    if (isMobileClient) {
                      // Mobile Cart additions
                      ref.read(cartNotifierProvider.notifier).addToCart(
                            idDrink: drink.id,
                            name: drink.name,
                            price: 25, // Cyber-mana price default
                            thumbnailUrl: drink.thumbnailUrl,
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Queued ${drink.name} in Replicator Cart!'),
                          backgroundColor: AppTheme.backgroundDeep,
                        ),
                      );
                    } else {
                      // Desktop default checkout message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Synthesizing ${drink.name} (Hologram)...'),
                          backgroundColor: AppTheme.backgroundDeep,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.bolt, color: Colors.black),
                  label: Text(
                    isMobileClient ? 'QUEUE IN REPLICATOR CART' : 'SYNTHESIZE ORDER',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.goldAccent,
                    shadowColor: AppTheme.goldAccent,
                    elevation: 12,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return GlassContainer(
      padding: const EdgeInsets.all(12),
      borderRadius: 16,
      backgroundColor: const Color(0x0AFFFFFF),
      borderColor: const Color(0x1BFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.goldAccent, size: 20),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 9,
              color: Color(0x80D1CBE5),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
