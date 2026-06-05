import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityBtn({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0x1BFFFFFF),
          border: Border.all(color: const Color(0x33FFFFFF)),
        ),
        child: Icon(icon, color: Colors.white, size: 16.r),
      ),
    );
  }
}
