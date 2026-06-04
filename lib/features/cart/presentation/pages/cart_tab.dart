import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';

class CartTab extends HookConsumerWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartNotifierProvider);
    final notifier = ref.read(cartNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const NeonText(
            text: 'ORDER REPLICATOR',
            glowColor: AppTheme.goldAccent,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Queue formulas to compile and synthesize them physically.',
            style: TextStyle(color: Color(0xFFA59EBF), fontSize: 13),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: state.cartItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: AppTheme.goldAccent.withValues(alpha: 0.5),
                          size: 64,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Replicator buffer is empty.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Scan menu catalog cards to queue formulas.',
                          style: TextStyle(color: Color(0xFF8F88A3), fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = state.cartItems[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: GlassContainer(
                                padding: const EdgeInsets.all(12),
                                borderRadius: 20,
                                blur: 10.0,
                                backgroundColor: const Color(0x0CFFFFFF),
                                borderColor: const Color(0x1BFFFFFF),
                                child: Row(
                                  children: [
                                    // Thumbnail
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: item.thumbnailUrl != null
                                          ? Image.network(
                                              item.thumbnailUrl!,
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              width: 70,
                                              height: 70,
                                              color: Colors.black26,
                                              child: const Icon(
                                                Icons.local_bar,
                                                 color: AppTheme.goldAccent,
                                              ),
                                            ),
                                    ),
                                    const SizedBox(width: 16),
                                    
                                    // Title & Pricing
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '${item.price} Mana',
                                            style: const TextStyle(
                                              color: AppTheme.goldAccent,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Quantity Controls
                                    Row(
                                      children: [
                                        _quantityBtn(
                                          icon: Icons.remove_rounded,
                                          onTap: () {
                                            notifier.updateQuantity(
                                              idDrink: item.id,
                                              quantity: item.quantity - 1,
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text(
                                            '${item.quantity}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        _quantityBtn(
                                          icon: Icons.add_rounded,
                                          onTap: () {
                                            notifier.updateQuantity(
                                              idDrink: item.id,
                                              quantity: item.quantity + 1,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      // Summary Card
                      const SizedBox(height: 16),
                      GlassContainer(
                        padding: const EdgeInsets.all(16),
                        borderRadius: 20,
                        backgroundColor: const Color(0x13FFFFFF),
                        borderColor: AppTheme.goldAccent.withValues(alpha: 0.3),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'TOTAL MANA REQUIRED',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFA59EBF),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                NeonText(
                                  text: '${notifier.totalMana} Mana',
                                  glowColor: AppTheme.goldAccent,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () async {
                                final count = state.cartItems.length;
                                await notifier.checkout();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Successfully synthesized $count formulas!'),
                                      backgroundColor: AppTheme.backgroundDeep,
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.rocket_launch_rounded, color: Colors.black),
                              label: const Text(
                                'SYNTHESIZE blue-prints',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.goldAccent,
                                shadowColor: AppTheme.goldAccent,
                                elevation: 8,
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _quantityBtn({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0x1BFFFFFF),
          border: Border.all(color: const Color(0x33FFFFFF)),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
