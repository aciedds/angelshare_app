import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/features/cart/domain/models/entities/cart_item_entity.dart';
import 'package:angelshare_app/features/cart/presentation/widgets/quantity_btn.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity item;
  final AppThemeColors themeColors;
  final void Function(int newQuantity) onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.item,
    required this.themeColors,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.all(AppSizes.md.w),
      borderRadius: AppSizes.radius2Xl,
      blur: 10.0,
      backgroundColor: themeColors.glassWhite,
      borderColor: themeColors.glassBorder,
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd.r),
            child: item.thumbnailUrl != null
                ? Image.network(
                    item.thumbnailUrl!,
                    width: 70.w,
                    height: 70.w,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 70.w,
                    height: 70.w,
                    color: Colors.black26,
                    child: Icon(
                      Icons.local_bar,
                      color: themeColors.accent,
                      size: 24.r,
                    ),
                  ),
          ),
          SizedBox(width: AppSizes.lg.w),

          // Title & Pricing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: AppSizes.fontLg.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSizes.xs.h),
                Text(
                  '${item.price} Mana',
                  style: TextStyle(
                    color: themeColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.fontSm.sp,
                  ),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Row(
            children: [
              QuantityBtn(
                icon: Icons.remove_rounded,
                onTap: () {
                  onQuantityChanged(item.quantity - 1);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  '${item.quantity}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.fontLg.sp,
                  ),
                ),
              ),
              QuantityBtn(
                icon: Icons.add_rounded,
                onTap: () {
                  onQuantityChanged(item.quantity + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
