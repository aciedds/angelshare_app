import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';

class UiControlPanelSheet extends HookConsumerWidget {
  const UiControlPanelSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configs = ref.watch(uiConfigProvider);
    final notifier = ref.read(uiConfigProvider.notifier);

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

    final currentTheme = notifier.getThemePreset();
    final headerMeta = notifier.getMetadata('welcome_header');
    final headerTitle = headerMeta['title'] as String? ?? "ANGEL'S SHARE";

    final textController = useTextEditingController(text: headerTitle);

    final catalogMeta = notifier.getMetadata('cocktail_catalog');
    final catalogLayout = catalogMeta['layoutType'] as String? ?? 'carousel';

    final synthMeta = notifier.getMetadata('synthesizer');
    final synthCategory = synthMeta['category'] as String?;

    // Sort widgets for display (excluding theme_preset itself from section order controls)
    final sections = configs.where((w) => w.id != 'theme_preset').toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: themeColors.backgroundObsidian,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(color: themeColors.glassBorder, width: 1.5),
            ),
          ),
          child: ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.xxl.w,
              vertical: AppSizes.lg.h,
            ),
            children: [
              // Handle line
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: AppSizes.xl.h),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                ),
              ),

              // Title
              Text(
                'UI CONTROL CENTER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.font3Xl.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'Configure themes, layouts, and variables dynamically.',
                style: TextStyle(
                  color: themeColors.accent.withValues(alpha: 0.7),
                  fontSize: AppSizes.fontSm.sp,
                ),
              ),
              SizedBox(height: AppSizes.xxl.h),

              // 1. THEME PRESETS SELECTOR
              Text(
                'THEMATIC SKIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.fontSm.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: AppSizes.sm.h),
              Row(
                children: [
                  _themeCard(
                    context: context,
                    name: 'Gold',
                    presetKey: 'gold',
                    isSelected: currentTheme == 'gold',
                    primaryColor: AppTheme.goldPrimary,
                    accentColor: AppTheme.goldAccent,
                    onTap: () => notifier.updateThemePreset('gold'),
                  ),
                  SizedBox(width: AppSizes.md.w),
                  _themeCard(
                    context: context,
                    name: 'Cyberpunk',
                    presetKey: 'cyberpunk',
                    isSelected: currentTheme == 'cyberpunk',
                    primaryColor: AppTheme.cyberpunkPrimary,
                    accentColor: AppTheme.cyberpunkAccent,
                    onTap: () => notifier.updateThemePreset('cyberpunk'),
                  ),
                  SizedBox(width: AppSizes.md.w),
                  _themeCard(
                    context: context,
                    name: 'Emerald',
                    presetKey: 'emerald',
                    isSelected: currentTheme == 'emerald',
                    primaryColor: AppTheme.emeraldPrimary,
                    accentColor: AppTheme.emeraldAccent,
                    onTap: () => notifier.updateThemePreset('emerald'),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.xxl.h),

              // 2. WELCOME HEADER TEXT
              Text(
                'WELCOME HEADER TEXT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.fontSm.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: AppSizes.sm.h),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontMd.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColors.glassWhite,
                        hintText: "Enter custom greeting...",
                        hintStyle: TextStyle(
                          color: Colors.white38,
                          fontSize: AppSizes.fontMd.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: themeColors.glassBorder),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.md.w),
                  ElevatedButton(
                    onPressed: () {
                      notifier.updateWidgetMetadata(
                        'welcome_header',
                        {'title': textController.text.toUpperCase()},
                      );
                      FocusScope.of(context).unfocus();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.lg.w,
                        vertical: AppSizes.lg.h,
                      ),
                    ),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSm.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.xxl.h),

              // 3. RECIPE GALLERY DISPLAY STYLE
              Text(
                'RECIPE LAYOUT STYLE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.fontSm.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: AppSizes.sm.h),
              Row(
                children: [
                  _layoutBtn(
                    label: '3D Carousel',
                    icon: Icons.view_carousel_rounded,
                    isSelected: catalogLayout == 'carousel',
                    activeColor: themeColors.primary,
                    onTap: () {
                      notifier.updateWidgetMetadata('cocktail_catalog', {'layoutType': 'carousel'});
                      notifier.toggleWidget('drink_selector', true);
                    },
                  ),
                  SizedBox(width: AppSizes.sm.w),
                  _layoutBtn(
                    label: '2-Col Grid',
                    icon: Icons.grid_view_rounded,
                    isSelected: catalogLayout == 'grid_2',
                    activeColor: themeColors.accent,
                    onTap: () {
                      notifier.updateWidgetMetadata('cocktail_catalog', {'layoutType': 'grid_2'});
                      // disable selector indicators as they are only relevant for carousel
                      notifier.toggleWidget('drink_selector', false);
                    },
                  ),
                  SizedBox(width: AppSizes.sm.w),
                  _layoutBtn(
                    label: 'List',
                    icon: Icons.view_agenda_rounded,
                    isSelected: catalogLayout == 'list_1',
                    activeColor: themeColors.primary,
                    onTap: () {
                      notifier.updateWidgetMetadata('cocktail_catalog', {'layoutType': 'list_1'});
                      notifier.toggleWidget('drink_selector', false);
                    },
                  ),
                ],
              ),
              SizedBox(height: AppSizes.xxl.h),

              // 4. SYNTHESIZER RESTRICTION
              Text(
                'SYNTHESIZER TARGET CATEGORY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.fontSm.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: AppSizes.sm.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.md.w),
                decoration: BoxDecoration(
                  color: themeColors.glassWhite,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: themeColors.glassBorder),
                ),
                child: DropdownButton<String?>(
                  value: synthCategory,
                  dropdownColor: themeColors.backgroundDeep,
                  isExpanded: true,
                  underline: const SizedBox(),
                  hint: Text(
                    'Random (All Categories)',
                    style: TextStyle(color: Colors.white54, fontSize: AppSizes.fontMd.sp),
                  ),
                  icon: Icon(Icons.arrow_drop_down, color: themeColors.accent),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text('Random (All Categories)', style: TextStyle(color: Colors.white)),
                    ),
                    const DropdownMenuItem(
                      value: 'Ordinary Drink',
                      child: Text('Ordinary Drink', style: TextStyle(color: Colors.white)),
                    ),
                    const DropdownMenuItem(
                      value: 'Cocktail',
                      child: Text('Cocktail', style: TextStyle(color: Colors.white)),
                    ),
                    const DropdownMenuItem(
                      value: 'Shot',
                      child: Text('Shot', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                  onChanged: (val) {
                    notifier.updateWidgetMetadata('synthesizer', {'category': val});
                  },
                ),
              ),
              SizedBox(height: AppSizes.xxl.h),

              // 5. SECTION ORDER & TOGGLES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PAGE WIDGETS CONFIG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.fontSm.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'ORDER & VISIBILITY',
                    style: TextStyle(
                      color: themeColors.accent,
                      fontSize: AppSizes.fontXs.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.sm.h),
              Column(
                children: List.generate(sections.length, (index) {
                  final section = sections[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: AppSizes.md.h),
                    child: GlassContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.md.w,
                        vertical: AppSizes.sm.h,
                      ),
                      borderRadius: 14,
                      backgroundColor: themeColors.glassWhite,
                      borderColor: themeColors.glassBorder,
                      child: Row(
                        children: [
                          // Up/Down Arrows to alter SortOrder
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_up,
                                    color: index > 0 ? themeColors.accent : Colors.white12,
                                    size: 18),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: index > 0
                                    ? () async {
                                        final other = sections[index - 1];
                                        final tempOrder = section.sortOrder;
                                        await notifier.updateWidgetPosition(section.id, other.sortOrder);
                                        await notifier.updateWidgetPosition(other.id, tempOrder);
                                      }
                                    : null,
                              ),
                              SizedBox(height: 2.h),
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: index < sections.length - 1 ? themeColors.accent : Colors.white12,
                                    size: 18),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: index < sections.length - 1
                                    ? () async {
                                        final other = sections[index + 1];
                                        final tempOrder = section.sortOrder;
                                        await notifier.updateWidgetPosition(section.id, other.sortOrder);
                                        await notifier.updateWidgetPosition(other.id, tempOrder);
                                      }
                                    : null,
                              ),
                            ],
                          ),
                          SizedBox(width: AppSizes.md.w),

                          // Widget Name
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  section.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppSizes.fontMd.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Slot: ${section.colorSlot.toUpperCase()}',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: AppSizes.fontXs.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Color Slot cycle button
                          IconButton(
                            icon: Icon(Icons.color_lens_rounded, color: themeColors.accent, size: 20),
                            tooltip: 'Cycle color slot',
                            onPressed: () {
                              const slots = ['primary', 'secondary', 'accent', 'muted'];
                              final currentIdx = slots.indexOf(section.colorSlot);
                              final nextSlot = slots[(currentIdx + 1) % slots.length];
                              notifier.updateWidgetColorSlot(section.id, nextSlot);
                            },
                          ),

                          // Toggle Switch
                          Switch(
                            value: section.isEnabled,
                            activeColor: themeColors.primary,
                            onChanged: (val) {
                              notifier.toggleWidget(section.id, val);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: AppSizes.xl.h),
            ],
          ),
        );
      },
    );
  }

  Widget _themeCard({
    required BuildContext context,
    required String name,
    required String presetKey,
    required bool isSelected,
    required Color primaryColor,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(vertical: AppSizes.lg.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? accentColor : Colors.white12,
              width: isSelected ? 2 : 1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                isSelected ? primaryColor.withValues(alpha: 0.25) : Colors.white10,
                isSelected ? accentColor.withValues(alpha: 0.1) : Colors.transparent,
              ],
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.25),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                : null,
          ),
          child: Column(
            children: [
              Icon(
                Icons.palette_rounded,
                color: isSelected ? accentColor : Colors.white38,
                size: 20,
              ),
              SizedBox(height: AppSizes.sm.h),
              Text(
                name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white54,
                  fontSize: AppSizes.fontSm.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _layoutBtn({
    required String label,
    required IconData icon,
    required bool isSelected,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(vertical: AppSizes.md.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? activeColor.withValues(alpha: 0.2) : Colors.white10,
            border: Border.all(
              color: isSelected ? activeColor : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.white38, size: 18),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white38,
                  fontSize: AppSizes.fontXs.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
