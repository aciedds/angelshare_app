import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:angelshare_app/core/theme/app_sizes.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/components/atoms/glass_container.dart';
import 'package:angelshare_app/core/components/atoms/glowing_orb.dart';
import 'package:angelshare_app/core/components/atoms/neon_text.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/pages/menu_catalog_page.dart';
import 'package:angelshare_app/features/auth/presentation/widgets/test_user_chip.dart';
import 'package:angelshare_app/features/auth/auth_provider.dart';
import 'package:angelshare_app/features/auth/presentation/notifier/auth_state.dart';
import 'package:angelshare_app/core/providers/view_state.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final authState = ref.watch(authNotifierProvider);

    ref.listen<ViewState<AuthState>>(authNotifierProvider, (previous, next) {
      if (next is ViewStateSuccess<AuthState>) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MenuCatalogPage()),
        );
      }
    });

    final data = authState.data ?? const AuthState();
    final isRegisterMode = data.isRegisterMode;
    final isLoading = authState is ViewStateLoading<AuthState>;
    final errorMessage = authState.maybeWhen(
      error: (msg, _) => msg,
      orElse: () => null,
    );

    final themeColors = Theme.of(context).extension<AppThemeColors>() ??
        const AppThemeColors(
          backgroundObsidian: Colors.black,
          backgroundDeep: Colors.black87,
          primary: AppTheme.goldPrimary,
          accent: AppTheme.goldAccent,
          muted: AppTheme.goldMuted,
          glassWhite: Colors.white10,
          glassBorder: Colors.white24,
          glassShadow: Colors.black38,
        );

    Future<void> handleAuth() async {
      final email = emailController.text.trim();
      await ref.read(authNotifierProvider.notifier).authenticate(email);
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(color: themeColors.backgroundObsidian),

          // Floating neon ambient orbs
          GlowingOrb(
            radius: 140.r,
            color: themeColors.primary,
            initialPosition: Offset(50.w, 150.h),
          ),
          GlowingOrb(
            radius: 170.r,
            color: themeColors.accent,
            initialPosition: Offset(280.w, 600.h),
          ),

          // Main contents
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.xxl.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Brand Header Logo
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 48.r,
                            color: themeColors.accent,
                            shadows: [
                              Shadow(
                                color: themeColors.accent,
                                blurRadius: 16.r,
                              )
                            ],
                          ),
                          SizedBox(height: AppSizes.md.h),
                          NeonText(
                            text: "ANGEL'S SHARE",
                            glowColor: themeColors.primary,
                            style: TextStyle(
                              fontSize: AppSizes.font4Xl.sp - 4.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            'Enter your credentials to replicate catalog access',
                            style: TextStyle(
                              fontSize: AppSizes.fontSm.sp,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.xxxl.h),

                    // Glass card containing Form
                    GlassContainer(
                      padding: EdgeInsets.all(AppSizes.xl.w),
                      borderRadius: AppSizes.radius3Xl,
                      backgroundColor: themeColors.glassWhite,
                      borderColor: themeColors.glassBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            isRegisterMode ? 'CREATE ARCHIVE ACCOUNT' : 'SECURE SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontLg.sp,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.xl.h),

                          // Email
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Replicator Email',
                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          ),
                          SizedBox(height: AppSizes.lg.h),

                          if (errorMessage != null) ...[
                            Text(
                              errorMessage,
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: AppSizes.fontSm.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: AppSizes.md.h),
                          ],

                          // Submit Button
                          ElevatedButton(
                            onPressed: isLoading ? null : handleAuth,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColors.accent,
                              shadowColor: themeColors.accent,
                              elevation: 6,
                              padding: EdgeInsets.symmetric(vertical: AppSizes.md.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: isLoading
                                ? SizedBox(
                                    height: 18.w,
                                    width: 18.w,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 2.w,
                                    ),
                                  )
                                : Text(
                                    isRegisterMode ? 'COMMENCE REGISTRATION' : 'INITIALIZE SYNC',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: AppSizes.fontSm.sp,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.xl.h),

                    // Toggle Register/Login Mode Link
                    TextButton(
                      onPressed: () {
                        ref.read(authNotifierProvider.notifier).toggleMode();
                      },
                      child: Text(
                        isRegisterMode
                            ? 'Already have credentials? Access database'
                            : "New fabricator? Record new profile key",
                        style: TextStyle(
                          color: themeColors.accent,
                          fontSize: AppSizes.fontSm.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSizes.xxl.h),

                    // Autofill testing assists for user
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'QUICK TEST ACCESS CREDENTIALS',
                            style: TextStyle(
                              color: Colors.white24,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: AppSizes.sm.h),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: AppSizes.md.w,
                            runSpacing: AppSizes.sm.h,
                            children: [
                              TestUserChip(
                                label: 'User 1 (Gold Preset)',
                                email: 'user1@example.com',
                                emailController: emailController,
                                themeColors: themeColors,
                              ),
                              TestUserChip(
                                label: 'User 2 (Custom Colors)',
                                email: 'user2@example.com',
                                emailController: emailController,
                                themeColors: themeColors,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

