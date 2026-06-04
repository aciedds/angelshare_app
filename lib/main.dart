import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:angelshare_app/core/theme/app_theme.dart';
import 'package:angelshare_app/features/menu_catalog/presentation/pages/menu_catalog_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Angel's Share",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MenuCatalogPage(),
    );
  }
}
