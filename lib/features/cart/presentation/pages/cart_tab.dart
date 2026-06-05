import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:angelshare_app/core/providers/view_state.dart';

class CartTab extends HookConsumerWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(cartNotifierProvider);
    final state = viewState.data ?? const CartState();
    final notifier = ref.read(cartNotifierProvider.notifier);

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

    if (viewState is ViewStateLoading<CartState> && state.cartItems.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: themeColors.accent),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xxl.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSizes.lg.h),
          NeonText(
            text: 'ORDER REPLICATOR',
            glowColor: themeColors.accent,
            style: TextStyle(
              fontSize: AppSizes.font3Xl.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: AppSizes.sm.h),
          Text(
            'Queue formulas to compile and synthesize them physically.',
            style: TextStyle(color: const Color(0xFFA59EBF), fontSize: AppSizes.fontSm.sp),
          ),
          SizedBox(height: AppSizes.xxl.h),

          Expanded(
            child: state.cartItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: themeColors.accent.withValues(alpha: 0.5),
                          size: 64.r,
                        ),
                        SizedBox(height: AppSizes.lg.h),
                        Text(
                          'Replicator buffer is empty.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSizes.fontLg.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSizes.sm.h),
                        Text(
                          'Scan menu catalog cards to queue formulas.',
                          style: TextStyle(color: const Color(0xFF8F88A3), fontSize: AppSizes.fontSm.sp),
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
                              padding: EdgeInsets.only(bottom: AppSizes.lg.h),
                              child: CartItemCard(
                                item: item,
                                themeColors: themeColors,
                                onQuantityChanged: (newQuantity) {
                                  notifier.updateQuantity(
                                    idDrink: item.id,
                                    quantity: newQuantity,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      // Summary Card
                      SizedBox(height: AppSizes.lg.h),
                      GlassContainer(
                        padding: EdgeInsets.all(AppSizes.lg.w),
                        borderRadius: AppSizes.radius2Xl,
                        backgroundColor: themeColors.glassWhite,
                        borderColor: themeColors.accent.withValues(alpha: 0.3),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOTAL MANA REQUIRED',
                                  style: TextStyle(
                                    fontSize: AppSizes.fontXs.sp,
                                    color: const Color(0xFFA59EBF),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                NeonText(
                                  text: '${notifier.totalMana} Mana',
                                  glowColor: themeColors.accent,
                                  style: TextStyle(
                                    fontSize: AppSizes.fontXl.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSizes.lg.h),
                            ElevatedButton.icon(
                              onPressed: () async {
                                final count = state.cartItems.length;
                                await notifier.checkout();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Successfully synthesized $count formulas!'),
                                      backgroundColor: themeColors.backgroundDeep,
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.rocket_launch_rounded, color: Colors.black, size: 18.r),
                              label: Text(
                                'SYNTHESIZE BLUEPRINTS',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  fontSize: AppSizes.fontSm.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themeColors.accent,
                                shadowColor: themeColors.accent,
                                elevation: 8,
                                minimumSize: Size.fromHeight(50.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

}
