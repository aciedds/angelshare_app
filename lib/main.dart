import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:angelshare_app/firebase_options.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/core/providers/ui_config_provider.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/pages/menu_catalog_page.dart';
import 'package:angelshare_app/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Color _parseHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch UI configurations to trigger rebuilds on theme modifications
    final _ = ref.watch(uiConfigProvider);
    final notifier = ref.read(uiConfigProvider.notifier);
    final themePreset = notifier.getThemePreset();
    final userEmail = ref.watch(currentUserEmailProvider);

    ThemeData selectedTheme;
    switch (themePreset) {
      case 'cyberpunk':
        selectedTheme = AppTheme.cyberpunkTheme;
        break;
      case 'emerald':
        selectedTheme = AppTheme.emeraldTheme;
        break;
      case 'custom':
        final customColors = notifier.getCustomColors();
        selectedTheme = AppTheme.buildCustomTheme(
          primary: _parseHex(customColors['primary'] ?? '#C5A059'),
          accent: _parseHex(customColors['accent'] ?? '#E5C287'),
          muted: _parseHex(customColors['muted'] ?? '#8A6E3B'),
          backgroundObsidian: _parseHex(customColors['backgroundObsidian'] ?? '#050505'),
          backgroundDeep: _parseHex(customColors['backgroundDeep'] ?? '#0E0E0E'),
        );
        break;
      case 'gold':
      default:
        selectedTheme = AppTheme.goldTheme;
        break;
    }

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Angel's Share",
          debugShowCheckedModeBanner: false,
          theme: selectedTheme,
          home: userEmail != null
              ? const MenuCatalogPage()
              : const LoginPage(),
        );
      },
    );
  }
}
