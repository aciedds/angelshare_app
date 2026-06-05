import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/core/providers/ui_widget_models.dart';
import 'package:angelshare_app/core/components/atoms/glowing_orb.dart';
import 'package:angelshare_app/core/components/molecules/custom_bottom_bar.dart';
import 'package:angelshare_app/features/cart/presentation/pages/cart_tab.dart';
import 'package:angelshare_app/features/favorites/presentation/pages/favorites_tab.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_sheet.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_skeleton.dart';
import 'package:angelshare_app/core/providers/view_state.dart';

// Extracted flat widgets
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/catalog_header.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/categories_slider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/cocktail_catalog.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_selector.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/synthesizer_tab.dart';

class MenuCatalogPage extends HookConsumerWidget {
  const MenuCatalogPage({super.key});

  Color _resolveColor(String slot, AppThemeColors colors) {
    switch (slot) {
      case 'primary':
        return colors.primary;
      case 'secondary':
        return colors.accent;
      case 'accent':
        return colors.accent;
      case 'muted':
        return colors.muted;
      default:
        return colors.primary;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(menuCatalogNotifierProvider);
    final state = viewState.data ?? const MenuCatalogState();
    final notifier = ref.read(menuCatalogNotifierProvider.notifier);

    // Watch dynamic UI configurations
    final uiConfigs = ref.watch(uiConfigProvider);
    final configNotifier = ref.read(uiConfigProvider.notifier);

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

    if (viewState is ViewStateLoading<MenuCatalogState> && state.categories.isEmpty) {
      return Scaffold(
        backgroundColor: themeColors.backgroundObsidian,
        body: Center(
          child: CircularProgressIndicator(color: themeColors.primary),
        ),
      );
    }

    final errorMessage = viewState.maybeWhen(
      error: (msg, _) => msg,
      orElse: () => null,
    );
    if (errorMessage != null && state.categories.isEmpty) {
      return Scaffold(
        backgroundColor: themeColors.backgroundObsidian,
        body: Center(
          child: Text(
            'Error loading catalog:\n$errorMessage',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final showOrbs = uiConfigs
        .firstWhere((w) => w.id == 'ambient_orbs',
            orElse: () => const AmbientOrbsConfig(id: 'ambient_orbs', name: '', isEnabled: true, sortOrder: 0, colorSlot: '', showOrbs: true))
        .isEnabled;

    // Scroll controllers
    final categoryScrollController = useScrollController();
    final pageController = usePageController(viewportFraction: 0.72);
    final bottomScrollController = useScrollController();
    final currentPage = useState(0);

    final filteredCocktails = notifier.getFilteredCocktails();

    // Reset currentPage and pageController when category changes
    useEffect(() {
      currentPage.value = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.jumpToPage(0);
        }
      });
      return null;
    }, [state.selectedCategory, filteredCocktails.length]);

    // Layout configuration
    final catalogMeta = configNotifier.getMetadata('cocktail_catalog');
    final catalogLayout = catalogMeta['layoutType'] as String? ?? 'carousel';

    // Tabs assembly based on client profile
    final List<Widget> tabs;
    if (isMobileClient) {
      tabs = [
        _buildCatalogTab(
          context: context,
          viewState: viewState,
          notifier: notifier,
          uiConfigs: uiConfigs,
          configNotifier: configNotifier,
          themeColors: themeColors,
          catalogLayout: catalogLayout,
          categoryScrollController: categoryScrollController,
          pageController: pageController,
          bottomScrollController: bottomScrollController,
          currentPage: currentPage,
          filteredCocktails: filteredCocktails,
          ref: ref,
        ),
        const FavoritesTab(),
        SynthesizerTab(
          state: state,
          notifier: notifier,
          configNotifier: configNotifier,
          themeColors: themeColors,
          onShowDetail: (drinkId, themeColor) {
            _showCocktailDetail(context: context, ref: ref, drinkId: drinkId, themeColor: themeColor);
          },
        ),
      ];
    } else {
      tabs = [
        _buildCatalogTab(
          context: context,
          viewState: viewState,
          notifier: notifier,
          uiConfigs: uiConfigs,
          configNotifier: configNotifier,
          themeColors: themeColors,
          catalogLayout: catalogLayout,
          categoryScrollController: categoryScrollController,
          pageController: pageController,
          bottomScrollController: bottomScrollController,
          currentPage: currentPage,
          filteredCocktails: filteredCocktails,
          ref: ref,
        ),
        SynthesizerTab(
          state: state,
          notifier: notifier,
          configNotifier: configNotifier,
          themeColors: themeColors,
          onShowDetail: (drinkId, themeColor) {
            _showCocktailDetail(context: context, ref: ref, drinkId: drinkId, themeColor: themeColor);
          },
        ),
      ];
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(color: themeColors.backgroundObsidian),

          // Floating Ambient Neon Orbs
          if (showOrbs) ...[
            GlowingOrb(
              radius: 160.r,
              color: themeColors.primary,
              initialPosition: Offset(40.w, 100.h),
            ),
            GlowingOrb(
              radius: 200.r,
              color: themeColors.accent,
              initialPosition: Offset(300.w, 400.h),
            ),
            GlowingOrb(
              radius: 150.r,
              color: themeColors.muted,
              initialPosition: Offset(80.w, 700.h),
            ),
          ],

          // Tabs contents
          SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.activeTab >= tabs.length ? 0 : state.activeTab,
              children: tabs,
            ),
          ),

          // Floating Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomBar(
              currentIndex: state.activeTab,
              onTap: (index) {
                notifier.setTab(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // --- DYNAMIC CATALOG TAB BUILDER ---
  Widget _buildCatalogTab({
    required BuildContext context,
    required ViewState<MenuCatalogState> viewState,
    required MenuCatalogNotifier notifier,
    required List<BaseWidgetConfig> uiConfigs,
    required UiConfigNotifier configNotifier,
    required AppThemeColors themeColors,
    required String catalogLayout,
    required ScrollController categoryScrollController,
    required PageController pageController,
    required ScrollController bottomScrollController,
    required ValueNotifier<int> currentPage,
    required List<AlcoholEntity> filteredCocktails,
    required WidgetRef ref,
  }) {
    final state = viewState.data ?? const MenuCatalogState();
    // Exclude 'theme_preset' and 'ambient_orbs' from vertical tab flow
    final activeSections = uiConfigs.where((w) => w.isEnabled && w.id != 'theme_preset' && w.id != 'ambient_orbs').toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    final catalogWidgets = activeSections.map<Widget>((section) {
      switch (section.id) {
        case 'welcome_header':
          final title = configNotifier.getMetadata('welcome_header')['title'] as String? ?? "ANGEL'S SHARE";
          final headerColor = _resolveColor(section.colorSlot, themeColors);
          return CatalogHeader(
            title: title,
            accentColor: headerColor,
            themeColors: themeColors,
            onCartTap: () => _showCartSheet(context: context, ref: ref),
          );

        case 'categories_slider':
          final sliderColor = _resolveColor(section.colorSlot, themeColors);
          return CategoriesSlider(
            state: state,
            isLoading: viewState is ViewStateLoading<MenuCatalogState>,
            notifier: notifier,
            controller: categoryScrollController,
            activeColor: sliderColor,
            themeColors: themeColors,
          );

        case 'cocktail_catalog':
          final color = _resolveColor(section.colorSlot, themeColors);
          return CocktailCatalog(
            state: state,
            isLoading: viewState is ViewStateLoading<MenuCatalogState>,
            errorMessage: viewState.maybeWhen(
              error: (msg, _) => msg,
              orElse: () => null,
            ),
            notifier: notifier,
            pageController: pageController,
            bottomScrollController: bottomScrollController,
            currentPage: currentPage,
            filteredCocktails: filteredCocktails,
            accentColor: color,
            themeColors: themeColors,
            layoutMode: catalogLayout,
            onShowDetail: (drinkId, themeColor) {
              _showCocktailDetail(context: context, ref: ref, drinkId: drinkId, themeColor: themeColor);
            },
          );

        case 'drink_selector':
          // Render indicator dots only in carousel layout
          if (catalogLayout != 'carousel') return const SizedBox.shrink();
          final color = _resolveColor(section.colorSlot, themeColors);
          return DrinkSelector(
            controller: bottomScrollController,
            pageController: pageController,
            currentPage: currentPage,
            filteredCocktails: filteredCocktails,
            activeColor: color,
          );

        default:
          return const SizedBox.shrink();
      }
    }).toList();

    // Reassemble list inserting responsive spaces
    List<Widget> columnChildren = [];
    for (int i = 0; i < catalogWidgets.length; i++) {
      if (catalogWidgets[i] is! SizedBox) {
        columnChildren.add(catalogWidgets[i]);
        if (i < catalogWidgets.length - 1) {
          columnChildren.add(SizedBox(height: AppSizes.md.h));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }

  // --- TRIGGER CART BOTTOM SHEET ---
  void _showCartSheet({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Container(
            decoration: const BoxDecoration(
              color: AppTheme.goldObsidian,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              border: Border(
                top: BorderSide(color: Color(0x26FFFFFF), width: 1.5),
              ),
            ),
            child: Stack(
              children: [
                const GlowingOrb(
                  radius: 120,
                  color: AppTheme.goldAccent,
                  initialPosition: Offset(200, 100),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: CartTab(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- TRIGGER DETAIL BOTTOM SHEET ---
  void _showCocktailDetail({
    required BuildContext context,
    required WidgetRef ref,
    required String drinkId,
    required Color themeColor,
  }) {
    ref.read(menuCatalogNotifierProvider.notifier).fetchDetail(id: drinkId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Consumer(
            builder: (context, ref, child) {
              final viewState = ref.watch(menuCatalogNotifierProvider);
              final sheetState = viewState.data ?? const MenuCatalogState();
              final isLoading = sheetState.isLoadingDetail || viewState is ViewStateLoading<MenuCatalogState>;
              if (isLoading) {
                return const DrinkDetailSkeleton();
              }
              final drinkDetail = sheetState.selectedDrinkDetail;
              if (drinkDetail == null) {
                final errorMessage = viewState.maybeWhen(
                  error: (message, _) => message,
                  orElse: () => null,
                );
                return Center(
                  child: Text(
                    errorMessage ?? 'Failed to load formula',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }
              return DrinkDetailSheet(drink: drinkDetail);
            },
          ),
        );
      },
    );
  }
}
