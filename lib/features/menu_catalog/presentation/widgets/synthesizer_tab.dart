import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/random_output_card.dart';

class SynthesizerTab extends StatelessWidget {
  final MenuCatalogState state;
  final MenuCatalogNotifier notifier;
  final UiConfigNotifier configNotifier;
  final AppThemeColors themeColors;
  final void Function(String drinkId, Color themeColor) onShowDetail;

  const SynthesizerTab({
    super.key,
    required this.state,
    required this.notifier,
    required this.configNotifier,
    required this.themeColors,
    required this.onShowDetail,
  });

  @override
  Widget build(BuildContext context) {
    final synthMeta = configNotifier.getMetadata('synthesizer');
    final synthCategory = synthMeta['category'] as String?;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xxl.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSizes.lg.h),
          NeonText(
            text: 'MAGICAL SYNTHESIZER',
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
            'Channel cyber-mana to fabricate a random cocktail recipe.',
            style: TextStyle(color: const Color(0xFFA0A0A0), fontSize: AppSizes.fontSm.sp),
          ),
          if (synthCategory != null) ...[
            SizedBox(height: 4.h),
            Text(
              'Synthesis Filter: $synthCategory',
              style: TextStyle(color: themeColors.accent, fontSize: AppSizes.fontXs.sp, fontWeight: FontWeight.bold),
            ),
          ],
          SizedBox(height: AppSizes.xxxl.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isSynthesizing) ...[
                    Container(
                      width: 150.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: themeColors.muted.withValues(alpha: 0.2), width: 4.w),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 120.w,
                            height: 120.w,
                            child: CircularProgressIndicator(
                              color: themeColors.primary,
                              strokeWidth: 4.w,
                            ),
                          ),
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: themeColors.accent,
                            size: 40.r,
                            shadows: [
                              Shadow(
                                color: themeColors.accent,
                                blurRadius: 12.r,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.xxl.h),
                    NeonText(
                      text: 'Fabricating Hologram...',
                      glowColor: themeColors.accent,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontLg.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else if (state.randomDrinkDetail != null) ...[
                    RandomOutputCard(
                      detail: state.randomDrinkDetail!,
                      themeColors: themeColors,
                      onRevealFullBlueprintTap: () {
                        onShowDetail(state.randomDrinkDetail!.id, themeColors.accent);
                      },
                    ),
                    SizedBox(height: AppSizes.xxxl.h),
                    _buildSynthesizeButton(synthCategory),
                  ] else ...[
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => notifier.fetchRandom(targetCategory: synthCategory),
                            child: Container(
                              width: 140.w,
                              height: 140.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: themeColors.muted.withValues(alpha: 0.1),
                                border: Border.all(color: themeColors.muted, width: 2.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeColors.muted.withValues(alpha: 0.3),
                                    blurRadius: 20.r,
                                    spreadRadius: 2.r,
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.bolt_rounded,
                                color: Colors.white,
                                size: 64.r,
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.xxl.h),
                          Text(
                            'TAP TO SYNTHESIZE BLUEPRINT',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: AppSizes.fontMd.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSynthesizeButton(String? synthCategory) {
    return ElevatedButton.icon(
      onPressed: () => notifier.fetchRandom(targetCategory: synthCategory),
      icon: Icon(Icons.bolt, color: Colors.white, size: 18.r),
      label: Text(
        'RE-SYNTHESIZE FORMULA',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: AppSizes.fontSm.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: themeColors.muted,
        shadowColor: themeColors.muted,
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: AppSizes.lg.h, horizontal: AppSizes.xl.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
