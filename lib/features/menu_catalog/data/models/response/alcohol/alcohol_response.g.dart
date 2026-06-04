// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcohol_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlcoholResponseImpl _$$AlcoholResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AlcoholResponseImpl(
  drinks: (json['drinks'] as List<dynamic>)
      .map((e) => AlcoholResponseItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AlcoholResponseImplToJson(
  _$AlcoholResponseImpl instance,
) => <String, dynamic>{'drinks': instance.drinks};

_$AlcoholResponseItemImpl _$$AlcoholResponseItemImplFromJson(
  Map<String, dynamic> json,
) => _$AlcoholResponseItemImpl(
  idDrink: json['idDrink'] as String,
  strDrink: json['strDrink'] as String,
  strDrinkThumb: json['strDrinkThumb'] as String?,
);

Map<String, dynamic> _$$AlcoholResponseItemImplToJson(
  _$AlcoholResponseItemImpl instance,
) => <String, dynamic>{
  'idDrink': instance.idDrink,
  'strDrink': instance.strDrink,
  'strDrinkThumb': instance.strDrinkThumb,
};
