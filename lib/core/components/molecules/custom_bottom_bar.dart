import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';

bool get isMobileClient => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<_BottomBarItem> items;
    if (isMobileClient) {
      items = [
        _BottomBarItem(icon: Icons.local_bar_rounded, label: 'Menu'),
        _BottomBarItem(icon: Icons.favorite_rounded, label: 'Archive'),
        _BottomBarItem(icon: Icons.auto_awesome_rounded, label: 'Magical'),
      ];
    } else {
      items = [
        _BottomBarItem(icon: Icons.local_bar_rounded, label: 'Menu'),
        _BottomBarItem(icon: Icons.auto_awesome_rounded, label: 'Magical'),
      ];
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: GlassContainer(
        borderRadius: 24,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        backgroundColor: const Color(0x18FFFFFF),
        borderColor: const Color(0x26FFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == currentIndex;
            
            final Color activeColor;
            if (isMobileClient) {
              activeColor = index == 0
                  ? AppTheme.goldPrimary
                  : index == 1
                      ? AppTheme.goldAccent
                      : AppTheme.goldAccent;
            } else {
              activeColor = index == 0
                  ? AppTheme.goldPrimary
                  : AppTheme.goldAccent;
            }

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: isSelected ? activeColor.withValues(alpha: 0.15) : Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? activeColor : const Color(0xFF8F88A3),
                      size: 24,
                      shadows: isSelected
                          ? [
                              Shadow(
                                color: activeColor,
                                blurRadius: 10,
                              )
                            ]
                          : null,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : const Color(0xFF8F88A3),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final IconData icon;
  final String label;

  const _BottomBarItem({
    required this.icon,
    required this.label,
  });
}
