import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';

class HistoryList extends ConsumerWidget {
  final CartState state;
  final AppThemeColors themeColors;

  const HistoryList({
    super.key,
    required this.state,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.orderHistory.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              color: themeColors.accent.withValues(alpha: 0.5),
              size: 56.r,
            ),
            SizedBox(height: AppSizes.lg.h),
            Text(
              'No checkout logs compiled.',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontLg.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.sm.h),
            Text(
              'Replicate queued drinks to compile order history records.',
              style: TextStyle(color: const Color(0xFF8F88A3), fontSize: AppSizes.fontSm.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 100.h),
      itemCount: state.orderHistory.length,
      itemBuilder: (context, index) {
        final log = state.orderHistory[index];
        final timeStr = "${log.orderedAt.day}/${log.orderedAt.month} ${log.orderedAt.hour.toString().padLeft(2, '0')}:${log.orderedAt.minute.toString().padLeft(2, '0')}";

        return Padding(
          padding: EdgeInsets.only(bottom: AppSizes.md.h),
          child: GlassContainer(
            padding: EdgeInsets.all(AppSizes.md.w),
            borderRadius: AppSizes.radiusXl,
            backgroundColor: themeColors.glassWhite,
            borderColor: themeColors.glassBorder,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm.r),
                  child: log.thumbnailUrl != null
                      ? Image.network(
                          log.thumbnailUrl!,
                          width: 55.w,
                          height: 55.w,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 55.w,
                          height: 55.w,
                          color: Colors.black26,
                          child: Icon(Icons.local_bar, color: themeColors.accent, size: 20.r),
                        ),
                ),
                SizedBox(width: AppSizes.lg.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontLg.sp,
                        ),
                      ),
                      SizedBox(height: AppSizes.xs.h),
                      Text(
                        'Quantity: ${log.quantity}x  |  $timeStr',
                        style: TextStyle(
                          color: const Color(0xFFA59EBF),
                          fontSize: AppSizes.fontSm.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.repeat_rounded, color: themeColors.accent, size: 22.r),
                  onPressed: () async {
                    await ref.read(cartNotifierProvider.notifier).addToCart(
                          idDrink: log.idDrink,
                          name: log.name,
                          price: 25,
                          thumbnailUrl: log.thumbnailUrl,
                          quantity: log.quantity,
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${log.quantity}x ${log.name} back to replicator cart!'),
                          backgroundColor: themeColors.backgroundDeep,
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
}
