import 'package:flutter/material.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';

class GlassSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextEditingController? controller;

  const GlassSearchBar({
    super.key,
    this.onChanged,
    this.hintText = 'Search recipe...',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.zero,
      borderRadius: 16.0,
      blur: 10.0,
      backgroundColor: const Color(0x0CFFFFFF),
      borderColor: const Color(0x1BFFFFFF),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppTheme.goldAccent,
          ),
          suffixIcon: controller != null && controller!.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded, color: AppTheme.goldMuted),
                  onPressed: () {
                    controller!.clear();
                    if (onChanged != null) onChanged!('');
                  },
                )
              : null,
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }
}
