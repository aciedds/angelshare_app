import 'dart:convert';
import 'package:angelshare_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:angelshare_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:angelshare_app/core/database/daos/ui_widget_dao.dart';
import 'package:angelshare_app/core/database/app_database.dart';
import 'package:angelshare_app/core/providers/data_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final UiWidgetDao _uiWidgetDao;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required UiWidgetDao uiWidgetDao,
  })  : _remoteDataSource = remoteDataSource,
        _uiWidgetDao = uiWidgetDao;

  @override
  Future<DataState<void>> signIn(String email) async {
    try {
      var data = await _remoteDataSource.fetchUserAppearance(email);
      if (data == null) {
        await _remoteDataSource.initializeUserAppearance(email);
        data = await _remoteDataSource.fetchUserAppearance(email);
      }
      if (data != null) {
        await _syncConfigs(data);
      }
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<DataState<void>> signUp(String email) async {
    try {
      await _remoteDataSource.initializeUserAppearance(email);
      final data = await _remoteDataSource.fetchUserAppearance(email);
      if (data != null) {
        await _syncConfigs(data);
      }
      return const DataState.success(null);
    } catch (e) {
      return DataState.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  Future<void> _syncConfigs(Map<String, dynamic> data) async {
    Map<String, dynamic> finalData = data;
    if (data['widgets'] is String) {
      try {
        finalData = jsonDecode(data['widgets'] as String) as Map<String, dynamic>;
      } catch (_) {}
    }

    final presetName = finalData['theme_preset'] as String? ?? 'gold';
    final customColors = finalData['custom_colors'] as Map<String, dynamic>?;

    if (presetName == 'custom' && customColors != null) {
      await _uiWidgetDao.insertConfig(UiWidgetConfig(
        id: 'theme_preset',
        name: 'Active Theme Preset',
        isEnabled: true,
        sortOrder: 0,
        colorSlot: 'primary',
        metadata: jsonEncode({
          'preset': 'custom',
          'primary': customColors['primary'],
          'accent': customColors['accent'],
          'muted': customColors['muted'],
          'backgroundObsidian': customColors['backgroundObsidian'],
          'backgroundDeep': customColors['backgroundDeep'],
        }),
      ));
    } else {
      await _uiWidgetDao.insertConfig(UiWidgetConfig(
        id: 'theme_preset',
        name: 'Active Theme Preset',
        isEnabled: true,
        sortOrder: 0,
        colorSlot: 'primary',
        metadata: jsonEncode({'preset': presetName}),
      ));
    }

    final widgetsData = finalData['widgets'] as Map<String, dynamic>? ?? {};
    for (final entry in widgetsData.entries) {
      final id = entry.key;
      final configMap = entry.value as Map<String, dynamic>;

      final isEnabled = configMap['isEnabled'] as bool? ?? true;
      final sortOrder = configMap['sortOrder'] as int? ?? 0;
      final colorSlot = configMap['colorSlot'] as String? ?? 'primary';

      final dynamic rawMeta = configMap['metadata'];
      String? metadataStr;
      if (rawMeta is Map) {
        metadataStr = jsonEncode(rawMeta);
      } else if (rawMeta is String) {
        metadataStr = rawMeta;
      }

      final updatedConfig = UiWidgetConfig(
        id: id,
        name: _getWidgetName(id),
        isEnabled: isEnabled,
        sortOrder: sortOrder,
        colorSlot: colorSlot,
        metadata: metadataStr,
      );

      await _uiWidgetDao.insertConfig(updatedConfig);
    }
  }

  String _getWidgetName(String id) {
    switch (id) {
      case 'welcome_header':
        return 'Welcome Header';
      case 'ambient_orbs':
        return 'Floating Ambient Orbs';
      case 'categories_slider':
        return 'Categories Slider';
      case 'cocktail_catalog':
        return 'Cocktail Catalog Gallery';
      case 'drink_selector':
        return 'Circular Drink Selector';
      case 'synthesizer':
        return 'Magical Synthesizer Tab Config';
      default:
        return id.replaceAll('_', ' ').toUpperCase();
    }
  }
}
