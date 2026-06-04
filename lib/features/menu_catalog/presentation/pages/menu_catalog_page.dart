import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/glowing_orb.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/core/components/molecules/custom_bottom_bar.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/features/cart/cart_provider.dart';
import 'package:angelshare_app/features/cart/presentation/pages/cart_tab.dart';
import 'package:angelshare_app/features/favorites/presentation/pages/favorites_tab.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/alcohol_entity.dart';
import 'package:angelshare_app/features/menu_catalog/domain/models/entities/alcohol/drink_detail_entity.dart';
import 'package:angelshare_app/features/menu_catalog/menu_catalog_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/notifier/menu_catalog_notifier.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_sheet.dart';
import 'package:angelshare_app/core/components/atoms/skeleton.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/widgets/drink_detail_skeleton.dart';

class MenuCatalogPage extends HookConsumerWidget {
  const MenuCatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menuCatalogNotifierProvider);
    final notifier = ref.read(menuCatalogNotifierProvider.notifier);

    // Scroll controller for horizontal list
    final categoryScrollController = useScrollController();

    final filteredCocktails = notifier.getFilteredCocktails();

    final pageController = usePageController(viewportFraction: 0.72);
    final bottomScrollController = useScrollController();
    final currentPage = useState(0);

    // Reset currentPage and pageController to 0 when category changes
    useEffect(() {
      currentPage.value = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.jumpToPage(0);
        }
      });
      return null;
    }, [state.selectedCategory, filteredCocktails.length]);

    // Dynamically choose layouts depending on platform
    final List<Widget> tabs;
    if (isMobileClient) {
      tabs = [
        _buildCatalogTab(
          context: context,
          state: state,
          notifier: notifier,
          categoryScrollController: categoryScrollController,
          pageController: pageController,
          bottomScrollController: bottomScrollController,
          currentPage: currentPage,
          filteredCocktails: filteredCocktails,
          ref: ref,
        ),
        const FavoritesTab(),
        _buildSynthesizerTab(
          context: context,
          state: state,
          notifier: notifier,
          ref: ref,
        ),
      ];
    } else {
      tabs = [
        _buildCatalogTab(
          context: context,
          state: state,
          notifier: notifier,
          categoryScrollController: categoryScrollController,
          pageController: pageController,
          bottomScrollController: bottomScrollController,
          currentPage: currentPage,
          filteredCocktails: filteredCocktails,
          ref: ref,
        ),
        _buildSynthesizerTab(
          context: context,
          state: state,
          notifier: notifier,
          ref: ref,
        ),
      ];
    }

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Obsidian Color
          Container(color: AppTheme.backgroundObsidian),
          
          // 2. Futuristic Glowing Orbs floating in background
          const GlowingOrb(
            radius: 160,
            color: AppTheme.goldPrimary,
            initialPosition: Offset(40, 100),
          ),
          const GlowingOrb(
            radius: 200,
            color: AppTheme.goldAccent,
            initialPosition: Offset(300, 400),
          ),
          const GlowingOrb(
            radius: 150,
            color: AppTheme.goldMuted,
            initialPosition: Offset(80, 700),
          ),

          // 3. Tab-based layouts
          SafeArea(
            bottom: false,
            child: IndexedStack(
              index: state.activeTab >= tabs.length ? 0 : state.activeTab,
              children: tabs,
            ),
          ),
          
          // 4. Floating Premium Navigation Bar
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

  // --- TAB BUILDERS ---

  Widget _buildCatalogTab({
    required BuildContext context,
    required MenuCatalogState state,
    required MenuCatalogNotifier notifier,
    required ScrollController categoryScrollController,
    required PageController pageController,
    required ScrollController bottomScrollController,
    required ValueNotifier<int> currentPage,
    required List<AlcoholEntity> filteredCocktails,
    required WidgetRef ref,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Glassmorphic AppBar
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 8.0),
          child: GlassContainer(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            borderRadius: 20,
            blur: 15,
            backgroundColor: const Color(0x0EFFFFFF),
            borderColor: AppTheme.glassBorder,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.goldAccent,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 2),
                    NeonText(
                      text: "ANGEL'S SHARE",
                      glowColor: AppTheme.goldPrimary,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => _showCartSheet(context: context, ref: ref),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final cartState = ref.watch(cartNotifierProvider);
                      final cartItemCount = cartState.cartItems.fold<int>(0, (sum, item) => sum + item.quantity);
                      
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.goldAccent, width: 1.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppTheme.goldAccent,
                                  blurRadius: 8,
                                ),
                              ],
                              color: Colors.black54,
                            ),
                            child: const Icon(
                              Icons.shopping_basket_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          if (cartItemCount > 0)
                            Positioned(
                              right: -4,
                              top: -4,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.goldMuted.withValues(alpha: 0.4),
                                      blurRadius: 6,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.goldMuted.withValues(alpha: 0.6),
                                        border: Border.all(
                                          color: AppTheme.goldAccent.withValues(alpha: 0.5),
                                          width: 1.0,
                                        ),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 16,
                                        minHeight: 16,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '$cartItemCount',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Categories Slider
        const SizedBox(height: 16),
        SizedBox(
          height: 50,
          child: state.isLoading && state.categories.isEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Skeleton(
                        width: 100,
                        height: 40,
                        borderRadius: 14,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  controller: categoryScrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    final isSelected = state.selectedCategory == category;
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => notifier.selectCategory(category: category),
                        child: GlassContainer(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          borderRadius: 14,
                          blur: 5.0,
                          backgroundColor: isSelected
                              ? AppTheme.goldPrimary.withValues(alpha: 0.25)
                              : const Color(0x0CFFFFFF),
                          borderColor: isSelected
                              ? AppTheme.goldPrimary
                              : const Color(0x1BFFFFFF),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFFA0A0A0),
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 14,
                                shadows: isSelected
                                    ? const [
                                        Shadow(
                                          color: AppTheme.goldPrimary,
                                          blurRadius: 8,
                                        )
                                      ]
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),

        const SizedBox(height: 16),

        // Cocktails Grid
        // Cocktails Gallery & Selector List
        Expanded(
          child: state.isLoading
              ? Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: SizedBox(
                          height: 380,
                          width: 270,
                          child: Skeleton(borderRadius: 24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Skeleton(
                              width: 65,
                              height: 65,
                              borderRadius: 32.5,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 100), // padding to clear bottom navigation bar
                  ],
                )
              : state.errorMessage != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: GlassContainer(
                          backgroundColor: const Color(0x22FF0000),
                          borderColor: Colors.redAccent,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 40),
                              const SizedBox(height: 8),
                              Text(
                                state.errorMessage!,
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () => notifier.init(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.goldPrimary,
                                ),
                                child: const Text('Try Again'),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : filteredCocktails.isEmpty
                      ? const Center(
                          child: Text(
                            'No holographic recipes match your search.',
                            style: TextStyle(color: Color(0xFF8F88A3)),
                          ),
                        )
                      : Column(
                          children: [
                            // 1. PageView Gallery Carousel
                            Expanded(
                              child: PageView.builder(
                                controller: pageController,
                                itemCount: filteredCocktails.length,
                                onPageChanged: (index) {
                                  currentPage.value = index;
                                  // Auto-center the bottom list item
                                  if (bottomScrollController.hasClients) {
                                    final screenWidth = MediaQuery.of(context).size.width;
                                    const itemWidth = 65.0;
                                    const spacing = 12.0;
                                    final target = (index * (itemWidth + spacing)) - (screenWidth / 2) + (itemWidth / 2);
                                    bottomScrollController.animateTo(
                                      target.clamp(0.0, bottomScrollController.position.maxScrollExtent),
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                },
                                itemBuilder: (context, index) {
                                  final drink = filteredCocktails[index];
                                  return AnimatedBuilder(
                                    animation: pageController,
                                    builder: (context, child) {
                                      double pageOffset = 0.0;
                                      if (pageController.position.haveDimensions) {
                                        pageOffset = pageController.page! - index;
                                      } else {
                                        pageOffset = (currentPage.value - index).toDouble();
                                      }

                                      final absOffset = pageOffset.abs();
                                      
                                      // Scale: active is 1.0, side cards scale down to 0.85
                                      final double scale = (1.0 - (absOffset * 0.15)).clamp(0.85, 1.0);
                                      
                                      // Translation Y: active is 0, side cards dip down by 25px
                                      final double translateY = absOffset * 25.0;
                                      
                                      // Rotation Z (roll/swipe tilt): rotates as it is swiped
                                      final double rotateZ = -pageOffset * 0.06;
                                      
                                      // Rotation Y (3D perspective tilt): rotates on Y axis for 3D depth
                                      final double rotateY = pageOffset * 0.12;
                                      
                                      // Opacity: active is 1.0, side cards fade to 0.5
                                      final double opacity = (1.0 - (absOffset * 0.4)).clamp(0.5, 1.0);

                                      // Activity factor for styling interpolation
                                      final double selectionLevel = (1.0 - absOffset).clamp(0.0, 1.0);

                                      return Transform(
                                        transform: Matrix4.identity()
                                          ..setEntry(3, 2, 0.001) // perspective tilt
                                          ..translate(0.0, translateY, 0.0)
                                          ..rotateY(rotateY)
                                          ..rotateZ(rotateZ)
                                          ..scale(scale),
                                        alignment: Alignment.center,
                                        child: Center(
                                          child: Opacity(
                                            opacity: opacity,
                                            child: SizedBox(
                                              height: 400.0,
                                              width: 300.0,
                                              child: _buildGalleryCard(
                                                context: context,
                                                drink: drink,
                                                selectionLevel: selectionLevel,
                                                ref: ref,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 12),

                            // 2. Bottom circular list selector
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                controller: bottomScrollController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                itemCount: filteredCocktails.length,
                                itemBuilder: (context, index) {
                                  final drink = filteredCocktails[index];
                                  final isActive = index == currentPage.value;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        currentPage.value = index;
                                        pageController.animateToPage(
                                          index,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOutCubic,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 250),
                                            width: isActive ? 60 : 52,
                                            height: isActive ? 60 : 52,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: isActive
                                                    ? AppTheme.goldPrimary
                                                    : const Color(0x26FFFFFF),
                                                width: isActive ? 2.0 : 1.0,
                                              ),
                                              boxShadow: isActive
                                                  ? [
                                                      BoxShadow(
                                                        color: AppTheme.goldPrimary.withValues(alpha: 0.6),
                                                        blurRadius: 10,
                                                        spreadRadius: 1,
                                                      )
                                                    ]
                                                  : null,
                                            ),
                                            child: ClipOval(
                                              child: drink.thumbnailUrl != null
                                                  ? Image.network(
                                                      drink.thumbnailUrl!,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) => Container(
                                                        color: Colors.black38,
                                                        child: const Icon(
                                                          Icons.local_bar_rounded,
                                                          color: AppTheme.goldMuted,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      color: Colors.black38,
                                                      child: const Icon(
                                                        Icons.local_bar_rounded,
                                                        color: AppTheme.goldMuted,
                                                        size: 20,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          SizedBox(
                                            width: 65,
                                            child: Text(
                                              drink.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                                                color: isActive ? Colors.white : const Color(0xFF8F88A3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 100), // Clearance for the bottom navigation bar
                          ],
                        ),
        ),
      ],
    );
  }

  Widget _buildGalleryCard({
    required BuildContext context,
    required AlcoholEntity drink,
    required double selectionLevel,
    required WidgetRef ref,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.goldPrimary.withValues(alpha: 0.3 * selectionLevel),
            blurRadius: 10.0 + 15.0 * selectionLevel,
            spreadRadius: 2.0 * selectionLevel,
          ),
        ],
      ),
      child: GlassContainer(
        padding: EdgeInsets.zero,
        borderRadius: 24,
        borderColor: Color.lerp(const Color(0x1BFFFFFF), AppTheme.goldPrimary, selectionLevel) ?? const Color(0x1BFFFFFF),
        backgroundColor: Color.lerp(const Color(0x11FFFFFF), const Color(0x1AFFFFFF), selectionLevel) ?? const Color(0x11FFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with clean curved corners and a subtle overlay gradient
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: drink.thumbnailUrl != null
                        ? Image.network(
                            drink.thumbnailUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.black38,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppTheme.goldAccent,
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.black38,
                              child: const Icon(
                                Icons.local_bar_rounded,
                                color: AppTheme.goldMuted,
                                size: 50,
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.black38,
                            child: const Icon(
                              Icons.local_bar_rounded,
                              color: AppTheme.goldAccent,
                              size: 50,
                            ),
                          ),
                  ),
                  // Subtle top-down vignette gradient for contrast
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: [
                             Colors.black54,
                             Colors.transparent,
                             Colors.transparent,
                             Colors.black.withValues(alpha: 0.8),
                           ],
                           stops: const [0.0, 0.3, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Text Info & Action Button
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ${drink.id}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppTheme.goldAccent,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const Icon(
                              Icons.bolt_rounded,
                              color: AppTheme.goldAccent,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          drink.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cyber-Elixir Formula',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),

                    // Premium Glow reveal button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Only allow opening details if the card is mostly in view (active card)
                          if (selectionLevel > 0.8) {
                            _showCocktailDetail(context: context, ref: ref, drinkId: drink.id);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.lerp(
                            AppTheme.goldMuted.withValues(alpha: 0.3),
                            AppTheme.goldPrimary,
                            selectionLevel,
                          ),
                          shadowColor: Color.lerp(
                            Colors.transparent,
                            AppTheme.goldPrimary,
                            selectionLevel,
                          ) ?? Colors.transparent,
                          elevation: 6.0 * selectionLevel,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: BorderSide(
                              color: Color.lerp(
                                const Color(0x33FFFFFF),
                                Colors.transparent,
                                selectionLevel,
                              ) ?? Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'REVEAL FORMULA',
                          style: TextStyle(
                            color: Color.lerp(
                              Colors.white70,
                              Colors.black,
                              selectionLevel,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              color: AppTheme.backgroundObsidian,
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

  Widget _buildSynthesizerTab({
    required BuildContext context,
    required MenuCatalogState state,
    required MenuCatalogNotifier notifier,
    required WidgetRef ref,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const NeonText(
            text: 'MAGICAL SYNTHESIZER',
            glowColor: AppTheme.goldMuted,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Channel cyber-mana to fabricate a random cocktail recipe.',
            style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 13),
          ),
          const SizedBox(height: 32),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isSynthesizing) ...[
                    // Synthesizing Loading Spin
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.goldMuted.withValues(alpha: 0.2), width: 4),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              color: AppTheme.goldMuted,
                              strokeWidth: 4,
                            ),
                          ),
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: AppTheme.goldAccent,
                            size: 40,
                            shadows: [
                              Shadow(
                                color: AppTheme.goldAccent,
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const NeonText(
                      text: 'Fabricating Hologram...',
                      glowColor: AppTheme.goldAccent,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else if (state.randomDrinkDetail != null) ...[
                    // Output result card
                    _buildRandomOutputCard(
                      context: context,
                      detail: state.randomDrinkDetail!,
                      ref: ref,
                    ),
                    const SizedBox(height: 32),
                    // Button to re-synthesize
                    _buildSynthesizeButton(notifier: notifier),
                  ] else ...[
                    // Initial button trigger
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => notifier.fetchRandom(),
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.goldMuted.withValues(alpha: 0.1),
                                border: Border.all(color: AppTheme.goldMuted, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.goldMuted.withValues(alpha: 0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: const Icon(
                                Icons.bolt_rounded,
                                color: Colors.white,
                                size: 64,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'TAP TO SYNTHESIZE blue-print recipe',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRandomOutputCard({
    required BuildContext context,
    required DrinkDetailEntity detail,
    required WidgetRef ref,
  }) {
    return GlassContainer(
      padding: EdgeInsets.zero,
      borderRadius: 24,
      blur: 20.0,
      backgroundColor: const Color(0x17FFFFFF),
      borderColor: AppTheme.goldAccent.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: detail.thumbnailUrl != null
                ? Image.network(
                    detail.thumbnailUrl!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 180,
                    color: Colors.black26,
                    child: const Icon(
                      Icons.local_bar_rounded,
                      color: AppTheme.goldMuted,
                      size: 48,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.goldAccent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.goldAccent.withValues(alpha: 0.4)),
                      ),
                      child: Text(
                        detail.category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.goldAccent,
                        ),
                      ),
                    ),
                    Text(
                      detail.alcoholic,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.goldMuted,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                NeonText(
                  text: detail.name,
                  glowColor: AppTheme.goldPrimary,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Instructions preview: ${detail.instructions}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    _showCocktailDetail(context: context, ref: ref, drinkId: detail.id);
                  },
                  icon: const Icon(Icons.chrome_reader_mode_rounded, color: Colors.black),
                  label: const Text(
                    'REVEAL FULL FORMULA',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.goldAccent,
                    shadowColor: AppTheme.goldAccent,
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSynthesizeButton({
    required MenuCatalogNotifier notifier,
  }) {
    return ElevatedButton.icon(
      onPressed: () => notifier.fetchRandom(),
      icon: const Icon(Icons.bolt, color: Colors.white),
      label: const Text(
        'RE-SYNTHESIZE FORMULA',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.goldMuted,
        shadowColor: AppTheme.goldMuted,
        elevation: 8,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // --- TRIGGER DETAIL BOTTOM SHEET ---

  void _showCocktailDetail({
    required BuildContext context,
    required WidgetRef ref,
    required String drinkId,
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
              final sheetState = ref.watch(menuCatalogNotifierProvider);
              if (sheetState.isLoadingDetail) {
                return const DrinkDetailSkeleton();
              }
              if (sheetState.selectedDrinkDetail == null) {
                return Center(
                  child: Text(
                    sheetState.errorMessage ?? 'Failed to load formula',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }
              return DrinkDetailSheet(drink: sheetState.selectedDrinkDetail!);
            },
          ),
        );
      },
    );
  }
}
