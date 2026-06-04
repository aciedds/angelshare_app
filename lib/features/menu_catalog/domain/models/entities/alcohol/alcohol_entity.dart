import 'package:freezed_annotation/freezed_annotation.dart';

part 'alcohol_entity.freezed.dart';

@freezed
class AlcoholEntity with _$AlcoholEntity {
  const factory AlcoholEntity({
    required String id,
    required String name,
    required String category,
    String? thumbnailUrl,
  }) = _AlcoholEntity;
}
