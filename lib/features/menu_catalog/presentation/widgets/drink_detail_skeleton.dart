import 'package:flutter/material.dart';
import 'package:angelshare_app/core/components/atoms/skeleton.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';

class DrinkDetailSkeleton extends StatelessWidget {
  const DrinkDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.backgroundDeep,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(
          top: BorderSide(color: Color(0x26FFFFFF), width: 1.5),
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Pull bar indicator
            Center(
              child: SizedBox(
                width: 50,
                height: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Image placeholder
            AspectRatio(
              aspectRatio: 1.3,
              child: Skeleton(borderRadius: 24),
            ),
            SizedBox(height: 24),
            // Specs placeholder
            Row(
              children: [
                Expanded(child: Skeleton(height: 70, borderRadius: 16)),
                SizedBox(width: 16),
                Expanded(child: Skeleton(height: 70, borderRadius: 16)),
              ],
            ),
            SizedBox(height: 24),
            // Title placeholder
            Skeleton(height: 20, width: 120),
            SizedBox(height: 12),
            // Ingredients placeholders
            Skeleton(height: 50, borderRadius: 16),
            SizedBox(height: 12),
            // Instructions placeholders
            Skeleton(height: 50, borderRadius: 16),
            SizedBox(height: 12),
            Skeleton(height: 50, borderRadius: 16),
          ],
        ),
      ),
    );
  }
}
