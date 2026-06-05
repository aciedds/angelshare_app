import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';

class TestUserChip extends StatelessWidget {
  final String label;
  final String email;
  final TextEditingController emailController;
  final AppThemeColors themeColors;

  const TestUserChip({
    super.key,
    required this.label,
    required this.email,
    required this.emailController,
    required this.themeColors,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.fontXs.sp - 1.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: themeColors.glassWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: themeColors.glassBorder),
      ),
      onPressed: () {
        emailController.text = email;
      },
    );
  }
}
