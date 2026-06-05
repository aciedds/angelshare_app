import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/components/molecules/ui_control_panel_sheet.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/core/providers/view_state.dart';

class CatalogHeader extends ConsumerWidget {
  final String title;
  final Color accentColor;
  final AppThemeColors themeColors;
  final VoidCallback onCartTap;

  const CatalogHeader({
    super.key,
    required this.title,
    required this.accentColor,
    required this.themeColors,
    required this.onCartTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.xxl.w, AppSizes.md.h, AppSizes.xxl.w, AppSizes.sm.h),
      child: GlassContainer(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.xl.w, vertical: AppSizes.md.h),
        borderRadius: AppSizes.radius2Xl,
        backgroundColor: themeColors.glassWhite,
        borderColor: themeColors.glassBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                      fontSize: AppSizes.fontXs.sp,
                      fontWeight: FontWeight.w600,
                      color: accentColor,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  NeonText(
                    text: title,
                    glowColor: accentColor,
                    style: TextStyle(
                      fontSize: AppSizes.font2Xl.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSizes.md.w),
            Row(
              children: [
                // UI Settings Cog Button
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black87,
                      builder: (context) => const UiControlPanelSheet(),
                    );
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: accentColor, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withValues(alpha: 0.5),
                          blurRadius: 8.r,
                        ),
                      ],
                      color: Colors.black54,
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.md.w),

                // Cart/Basket Button
                GestureDetector(
                  onTap: onCartTap,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final ViewState<CartState> cartViewState = ref.watch(cartNotifierProvider);
                      final cartState = cartViewState.data ?? const CartState();
                      final cartItemCount = cartState.cartItems.fold<int>(0, (sum, item) => sum + item.quantity);

                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: accentColor, width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor.withValues(alpha: 0.5),
                                  blurRadius: 8.r,
                                ),
                              ],
                              color: Colors.black54,
                            ),
                            child: const Icon(
                              Icons.shopping_basket_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          if (cartItemCount > 0)
                            Positioned(
                              right: -4.w,
                              top: -4.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeColors.muted.withValues(alpha: 0.4),
                                      blurRadius: 6.r,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeColors.muted.withValues(alpha: 0.6),
                                        border: Border.all(
                                          color: accentColor.withValues(alpha: 0.5),
                                          width: 1.0,
                                        ),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 16.w,
                                        minHeight: 16.w,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '$cartItemCount',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
