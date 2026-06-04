// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AlcoholTableTable extends AlcoholTable
    with TableInfo<$AlcoholTableTable, AlcoholTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlcoholTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDrinkMeta = const VerificationMeta(
    'idDrink',
  );
  @override
  late final GeneratedColumn<String> idDrink = GeneratedColumn<String>(
    'id_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkMeta = const VerificationMeta(
    'strDrink',
  );
  @override
  late final GeneratedColumn<String> strDrink = GeneratedColumn<String>(
    'str_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkThumbMeta = const VerificationMeta(
    'strDrinkThumb',
  );
  @override
  late final GeneratedColumn<String> strDrinkThumb = GeneratedColumn<String>(
    'str_drink_thumb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strCategoryMeta = const VerificationMeta(
    'strCategory',
  );
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
    'str_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDrink,
    strDrink,
    strDrinkThumb,
    strCategory,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alcohol_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlcoholTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_drink')) {
      context.handle(
        _idDrinkMeta,
        idDrink.isAcceptableOrUnknown(data['id_drink']!, _idDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_idDrinkMeta);
    }
    if (data.containsKey('str_drink')) {
      context.handle(
        _strDrinkMeta,
        strDrink.isAcceptableOrUnknown(data['str_drink']!, _strDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_strDrinkMeta);
    }
    if (data.containsKey('str_drink_thumb')) {
      context.handle(
        _strDrinkThumbMeta,
        strDrinkThumb.isAcceptableOrUnknown(
          data['str_drink_thumb']!,
          _strDrinkThumbMeta,
        ),
      );
    }
    if (data.containsKey('str_category')) {
      context.handle(
        _strCategoryMeta,
        strCategory.isAcceptableOrUnknown(
          data['str_category']!,
          _strCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDrink};
  @override
  AlcoholTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlcoholTableData(
      idDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_drink'],
      )!,
      strDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink'],
      )!,
      strDrinkThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink_thumb'],
      ),
      strCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_category'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $AlcoholTableTable createAlias(String alias) {
    return $AlcoholTableTable(attachedDatabase, alias);
  }
}

class AlcoholTableData extends DataClass
    implements Insertable<AlcoholTableData> {
  final String idDrink;
  final String strDrink;
  final String? strDrinkThumb;
  final String strCategory;
  final DateTime cachedAt;
  const AlcoholTableData({
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
    required this.strCategory,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_drink'] = Variable<String>(idDrink);
    map['str_drink'] = Variable<String>(strDrink);
    if (!nullToAbsent || strDrinkThumb != null) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb);
    }
    map['str_category'] = Variable<String>(strCategory);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  AlcoholTableCompanion toCompanion(bool nullToAbsent) {
    return AlcoholTableCompanion(
      idDrink: Value(idDrink),
      strDrink: Value(strDrink),
      strDrinkThumb: strDrinkThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkThumb),
      strCategory: Value(strCategory),
      cachedAt: Value(cachedAt),
    );
  }

  factory AlcoholTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlcoholTableData(
      idDrink: serializer.fromJson<String>(json['idDrink']),
      strDrink: serializer.fromJson<String>(json['strDrink']),
      strDrinkThumb: serializer.fromJson<String?>(json['strDrinkThumb']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDrink': serializer.toJson<String>(idDrink),
      'strDrink': serializer.toJson<String>(strDrink),
      'strDrinkThumb': serializer.toJson<String?>(strDrinkThumb),
      'strCategory': serializer.toJson<String>(strCategory),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  AlcoholTableData copyWith({
    String? idDrink,
    String? strDrink,
    Value<String?> strDrinkThumb = const Value.absent(),
    String? strCategory,
    DateTime? cachedAt,
  }) => AlcoholTableData(
    idDrink: idDrink ?? this.idDrink,
    strDrink: strDrink ?? this.strDrink,
    strDrinkThumb: strDrinkThumb.present
        ? strDrinkThumb.value
        : this.strDrinkThumb,
    strCategory: strCategory ?? this.strCategory,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  AlcoholTableData copyWithCompanion(AlcoholTableCompanion data) {
    return AlcoholTableData(
      idDrink: data.idDrink.present ? data.idDrink.value : this.idDrink,
      strDrink: data.strDrink.present ? data.strDrink.value : this.strDrink,
      strDrinkThumb: data.strDrinkThumb.present
          ? data.strDrinkThumb.value
          : this.strDrinkThumb,
      strCategory: data.strCategory.present
          ? data.strCategory.value
          : this.strCategory,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlcoholTableData(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idDrink, strDrink, strDrinkThumb, strCategory, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlcoholTableData &&
          other.idDrink == this.idDrink &&
          other.strDrink == this.strDrink &&
          other.strDrinkThumb == this.strDrinkThumb &&
          other.strCategory == this.strCategory &&
          other.cachedAt == this.cachedAt);
}

class AlcoholTableCompanion extends UpdateCompanion<AlcoholTableData> {
  final Value<String> idDrink;
  final Value<String> strDrink;
  final Value<String?> strDrinkThumb;
  final Value<String> strCategory;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const AlcoholTableCompanion({
    this.idDrink = const Value.absent(),
    this.strDrink = const Value.absent(),
    this.strDrinkThumb = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlcoholTableCompanion.insert({
    required String idDrink,
    required String strDrink,
    this.strDrinkThumb = const Value.absent(),
    required String strCategory,
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idDrink = Value(idDrink),
       strDrink = Value(strDrink),
       strCategory = Value(strCategory);
  static Insertable<AlcoholTableData> custom({
    Expression<String>? idDrink,
    Expression<String>? strDrink,
    Expression<String>? strDrinkThumb,
    Expression<String>? strCategory,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idDrink != null) 'id_drink': idDrink,
      if (strDrink != null) 'str_drink': strDrink,
      if (strDrinkThumb != null) 'str_drink_thumb': strDrinkThumb,
      if (strCategory != null) 'str_category': strCategory,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlcoholTableCompanion copyWith({
    Value<String>? idDrink,
    Value<String>? strDrink,
    Value<String?>? strDrinkThumb,
    Value<String>? strCategory,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return AlcoholTableCompanion(
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      strCategory: strCategory ?? this.strCategory,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDrink.present) {
      map['id_drink'] = Variable<String>(idDrink.value);
    }
    if (strDrink.present) {
      map['str_drink'] = Variable<String>(strDrink.value);
    }
    if (strDrinkThumb.present) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlcoholTableCompanion(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlcoholDetailTableTable extends AlcoholDetailTable
    with TableInfo<$AlcoholDetailTableTable, AlcoholDetailTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlcoholDetailTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDrinkMeta = const VerificationMeta(
    'idDrink',
  );
  @override
  late final GeneratedColumn<String> idDrink = GeneratedColumn<String>(
    'id_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkMeta = const VerificationMeta(
    'strDrink',
  );
  @override
  late final GeneratedColumn<String> strDrink = GeneratedColumn<String>(
    'str_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkThumbMeta = const VerificationMeta(
    'strDrinkThumb',
  );
  @override
  late final GeneratedColumn<String> strDrinkThumb = GeneratedColumn<String>(
    'str_drink_thumb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strCategoryMeta = const VerificationMeta(
    'strCategory',
  );
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
    'str_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strGlassMeta = const VerificationMeta(
    'strGlass',
  );
  @override
  late final GeneratedColumn<String> strGlass = GeneratedColumn<String>(
    'str_glass',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strAlcoholicMeta = const VerificationMeta(
    'strAlcoholic',
  );
  @override
  late final GeneratedColumn<String> strAlcoholic = GeneratedColumn<String>(
    'str_alcoholic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strInstructionsMeta = const VerificationMeta(
    'strInstructions',
  );
  @override
  late final GeneratedColumn<String> strInstructions = GeneratedColumn<String>(
    'str_instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<IngredientTableItem>, String>
  ingredients =
      GeneratedColumn<String>(
        'ingredients',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<IngredientTableItem>>(
        $AlcoholDetailTableTable.$converteringredients,
      );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDrink,
    strDrink,
    strDrinkThumb,
    strCategory,
    strGlass,
    strAlcoholic,
    strInstructions,
    ingredients,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alcohol_detail_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlcoholDetailTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_drink')) {
      context.handle(
        _idDrinkMeta,
        idDrink.isAcceptableOrUnknown(data['id_drink']!, _idDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_idDrinkMeta);
    }
    if (data.containsKey('str_drink')) {
      context.handle(
        _strDrinkMeta,
        strDrink.isAcceptableOrUnknown(data['str_drink']!, _strDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_strDrinkMeta);
    }
    if (data.containsKey('str_drink_thumb')) {
      context.handle(
        _strDrinkThumbMeta,
        strDrinkThumb.isAcceptableOrUnknown(
          data['str_drink_thumb']!,
          _strDrinkThumbMeta,
        ),
      );
    }
    if (data.containsKey('str_category')) {
      context.handle(
        _strCategoryMeta,
        strCategory.isAcceptableOrUnknown(
          data['str_category']!,
          _strCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('str_glass')) {
      context.handle(
        _strGlassMeta,
        strGlass.isAcceptableOrUnknown(data['str_glass']!, _strGlassMeta),
      );
    } else if (isInserting) {
      context.missing(_strGlassMeta);
    }
    if (data.containsKey('str_alcoholic')) {
      context.handle(
        _strAlcoholicMeta,
        strAlcoholic.isAcceptableOrUnknown(
          data['str_alcoholic']!,
          _strAlcoholicMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strAlcoholicMeta);
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
        _strInstructionsMeta,
        strInstructions.isAcceptableOrUnknown(
          data['str_instructions']!,
          _strInstructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strInstructionsMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDrink};
  @override
  AlcoholDetailTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlcoholDetailTableData(
      idDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_drink'],
      )!,
      strDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink'],
      )!,
      strDrinkThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink_thumb'],
      ),
      strCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_category'],
      )!,
      strGlass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_glass'],
      )!,
      strAlcoholic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_alcoholic'],
      )!,
      strInstructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_instructions'],
      )!,
      ingredients: $AlcoholDetailTableTable.$converteringredients.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ingredients'],
        )!,
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $AlcoholDetailTableTable createAlias(String alias) {
    return $AlcoholDetailTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<IngredientTableItem>, String>
  $converteringredients = const IngredientsConverter();
}

class AlcoholDetailTableData extends DataClass
    implements Insertable<AlcoholDetailTableData> {
  final String idDrink;
  final String strDrink;
  final String? strDrinkThumb;
  final String strCategory;
  final String strGlass;
  final String strAlcoholic;
  final String strInstructions;
  final List<IngredientTableItem> ingredients;
  final DateTime cachedAt;
  const AlcoholDetailTableData({
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
    required this.strCategory,
    required this.strGlass,
    required this.strAlcoholic,
    required this.strInstructions,
    required this.ingredients,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_drink'] = Variable<String>(idDrink);
    map['str_drink'] = Variable<String>(strDrink);
    if (!nullToAbsent || strDrinkThumb != null) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb);
    }
    map['str_category'] = Variable<String>(strCategory);
    map['str_glass'] = Variable<String>(strGlass);
    map['str_alcoholic'] = Variable<String>(strAlcoholic);
    map['str_instructions'] = Variable<String>(strInstructions);
    {
      map['ingredients'] = Variable<String>(
        $AlcoholDetailTableTable.$converteringredients.toSql(ingredients),
      );
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  AlcoholDetailTableCompanion toCompanion(bool nullToAbsent) {
    return AlcoholDetailTableCompanion(
      idDrink: Value(idDrink),
      strDrink: Value(strDrink),
      strDrinkThumb: strDrinkThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkThumb),
      strCategory: Value(strCategory),
      strGlass: Value(strGlass),
      strAlcoholic: Value(strAlcoholic),
      strInstructions: Value(strInstructions),
      ingredients: Value(ingredients),
      cachedAt: Value(cachedAt),
    );
  }

  factory AlcoholDetailTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlcoholDetailTableData(
      idDrink: serializer.fromJson<String>(json['idDrink']),
      strDrink: serializer.fromJson<String>(json['strDrink']),
      strDrinkThumb: serializer.fromJson<String?>(json['strDrinkThumb']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strGlass: serializer.fromJson<String>(json['strGlass']),
      strAlcoholic: serializer.fromJson<String>(json['strAlcoholic']),
      strInstructions: serializer.fromJson<String>(json['strInstructions']),
      ingredients: serializer.fromJson<List<IngredientTableItem>>(
        json['ingredients'],
      ),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDrink': serializer.toJson<String>(idDrink),
      'strDrink': serializer.toJson<String>(strDrink),
      'strDrinkThumb': serializer.toJson<String?>(strDrinkThumb),
      'strCategory': serializer.toJson<String>(strCategory),
      'strGlass': serializer.toJson<String>(strGlass),
      'strAlcoholic': serializer.toJson<String>(strAlcoholic),
      'strInstructions': serializer.toJson<String>(strInstructions),
      'ingredients': serializer.toJson<List<IngredientTableItem>>(ingredients),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  AlcoholDetailTableData copyWith({
    String? idDrink,
    String? strDrink,
    Value<String?> strDrinkThumb = const Value.absent(),
    String? strCategory,
    String? strGlass,
    String? strAlcoholic,
    String? strInstructions,
    List<IngredientTableItem>? ingredients,
    DateTime? cachedAt,
  }) => AlcoholDetailTableData(
    idDrink: idDrink ?? this.idDrink,
    strDrink: strDrink ?? this.strDrink,
    strDrinkThumb: strDrinkThumb.present
        ? strDrinkThumb.value
        : this.strDrinkThumb,
    strCategory: strCategory ?? this.strCategory,
    strGlass: strGlass ?? this.strGlass,
    strAlcoholic: strAlcoholic ?? this.strAlcoholic,
    strInstructions: strInstructions ?? this.strInstructions,
    ingredients: ingredients ?? this.ingredients,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  AlcoholDetailTableData copyWithCompanion(AlcoholDetailTableCompanion data) {
    return AlcoholDetailTableData(
      idDrink: data.idDrink.present ? data.idDrink.value : this.idDrink,
      strDrink: data.strDrink.present ? data.strDrink.value : this.strDrink,
      strDrinkThumb: data.strDrinkThumb.present
          ? data.strDrinkThumb.value
          : this.strDrinkThumb,
      strCategory: data.strCategory.present
          ? data.strCategory.value
          : this.strCategory,
      strGlass: data.strGlass.present ? data.strGlass.value : this.strGlass,
      strAlcoholic: data.strAlcoholic.present
          ? data.strAlcoholic.value
          : this.strAlcoholic,
      strInstructions: data.strInstructions.present
          ? data.strInstructions.value
          : this.strInstructions,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlcoholDetailTableData(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('strGlass: $strGlass, ')
          ..write('strAlcoholic: $strAlcoholic, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('ingredients: $ingredients, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idDrink,
    strDrink,
    strDrinkThumb,
    strCategory,
    strGlass,
    strAlcoholic,
    strInstructions,
    ingredients,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlcoholDetailTableData &&
          other.idDrink == this.idDrink &&
          other.strDrink == this.strDrink &&
          other.strDrinkThumb == this.strDrinkThumb &&
          other.strCategory == this.strCategory &&
          other.strGlass == this.strGlass &&
          other.strAlcoholic == this.strAlcoholic &&
          other.strInstructions == this.strInstructions &&
          other.ingredients == this.ingredients &&
          other.cachedAt == this.cachedAt);
}

class AlcoholDetailTableCompanion
    extends UpdateCompanion<AlcoholDetailTableData> {
  final Value<String> idDrink;
  final Value<String> strDrink;
  final Value<String?> strDrinkThumb;
  final Value<String> strCategory;
  final Value<String> strGlass;
  final Value<String> strAlcoholic;
  final Value<String> strInstructions;
  final Value<List<IngredientTableItem>> ingredients;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const AlcoholDetailTableCompanion({
    this.idDrink = const Value.absent(),
    this.strDrink = const Value.absent(),
    this.strDrinkThumb = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strGlass = const Value.absent(),
    this.strAlcoholic = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlcoholDetailTableCompanion.insert({
    required String idDrink,
    required String strDrink,
    this.strDrinkThumb = const Value.absent(),
    required String strCategory,
    required String strGlass,
    required String strAlcoholic,
    required String strInstructions,
    required List<IngredientTableItem> ingredients,
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idDrink = Value(idDrink),
       strDrink = Value(strDrink),
       strCategory = Value(strCategory),
       strGlass = Value(strGlass),
       strAlcoholic = Value(strAlcoholic),
       strInstructions = Value(strInstructions),
       ingredients = Value(ingredients);
  static Insertable<AlcoholDetailTableData> custom({
    Expression<String>? idDrink,
    Expression<String>? strDrink,
    Expression<String>? strDrinkThumb,
    Expression<String>? strCategory,
    Expression<String>? strGlass,
    Expression<String>? strAlcoholic,
    Expression<String>? strInstructions,
    Expression<String>? ingredients,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idDrink != null) 'id_drink': idDrink,
      if (strDrink != null) 'str_drink': strDrink,
      if (strDrinkThumb != null) 'str_drink_thumb': strDrinkThumb,
      if (strCategory != null) 'str_category': strCategory,
      if (strGlass != null) 'str_glass': strGlass,
      if (strAlcoholic != null) 'str_alcoholic': strAlcoholic,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (ingredients != null) 'ingredients': ingredients,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlcoholDetailTableCompanion copyWith({
    Value<String>? idDrink,
    Value<String>? strDrink,
    Value<String?>? strDrinkThumb,
    Value<String>? strCategory,
    Value<String>? strGlass,
    Value<String>? strAlcoholic,
    Value<String>? strInstructions,
    Value<List<IngredientTableItem>>? ingredients,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return AlcoholDetailTableCompanion(
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      strCategory: strCategory ?? this.strCategory,
      strGlass: strGlass ?? this.strGlass,
      strAlcoholic: strAlcoholic ?? this.strAlcoholic,
      strInstructions: strInstructions ?? this.strInstructions,
      ingredients: ingredients ?? this.ingredients,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDrink.present) {
      map['id_drink'] = Variable<String>(idDrink.value);
    }
    if (strDrink.present) {
      map['str_drink'] = Variable<String>(strDrink.value);
    }
    if (strDrinkThumb.present) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strGlass.present) {
      map['str_glass'] = Variable<String>(strGlass.value);
    }
    if (strAlcoholic.present) {
      map['str_alcoholic'] = Variable<String>(strAlcoholic.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(
        $AlcoholDetailTableTable.$converteringredients.toSql(ingredients.value),
      );
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlcoholDetailTableCompanion(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('strGlass: $strGlass, ')
          ..write('strAlcoholic: $strAlcoholic, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('ingredients: $ingredients, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartTableTable extends CartTable
    with TableInfo<$CartTableTable, CartTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDrinkMeta = const VerificationMeta(
    'idDrink',
  );
  @override
  late final GeneratedColumn<String> idDrink = GeneratedColumn<String>(
    'id_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkMeta = const VerificationMeta(
    'strDrink',
  );
  @override
  late final GeneratedColumn<String> strDrink = GeneratedColumn<String>(
    'str_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkThumbMeta = const VerificationMeta(
    'strDrinkThumb',
  );
  @override
  late final GeneratedColumn<String> strDrinkThumb = GeneratedColumn<String>(
    'str_drink_thumb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDrink,
    strDrink,
    strDrinkThumb,
    quantity,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_drink')) {
      context.handle(
        _idDrinkMeta,
        idDrink.isAcceptableOrUnknown(data['id_drink']!, _idDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_idDrinkMeta);
    }
    if (data.containsKey('str_drink')) {
      context.handle(
        _strDrinkMeta,
        strDrink.isAcceptableOrUnknown(data['str_drink']!, _strDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_strDrinkMeta);
    }
    if (data.containsKey('str_drink_thumb')) {
      context.handle(
        _strDrinkThumbMeta,
        strDrinkThumb.isAcceptableOrUnknown(
          data['str_drink_thumb']!,
          _strDrinkThumbMeta,
        ),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDrink};
  @override
  CartTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartTableData(
      idDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_drink'],
      )!,
      strDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink'],
      )!,
      strDrinkThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink_thumb'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $CartTableTable createAlias(String alias) {
    return $CartTableTable(attachedDatabase, alias);
  }
}

class CartTableData extends DataClass implements Insertable<CartTableData> {
  final String idDrink;
  final String strDrink;
  final String? strDrinkThumb;
  final int quantity;
  final int price;
  const CartTableData({
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
    required this.quantity,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_drink'] = Variable<String>(idDrink);
    map['str_drink'] = Variable<String>(strDrink);
    if (!nullToAbsent || strDrinkThumb != null) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb);
    }
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    return map;
  }

  CartTableCompanion toCompanion(bool nullToAbsent) {
    return CartTableCompanion(
      idDrink: Value(idDrink),
      strDrink: Value(strDrink),
      strDrinkThumb: strDrinkThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkThumb),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory CartTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartTableData(
      idDrink: serializer.fromJson<String>(json['idDrink']),
      strDrink: serializer.fromJson<String>(json['strDrink']),
      strDrinkThumb: serializer.fromJson<String?>(json['strDrinkThumb']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDrink': serializer.toJson<String>(idDrink),
      'strDrink': serializer.toJson<String>(strDrink),
      'strDrinkThumb': serializer.toJson<String?>(strDrinkThumb),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
    };
  }

  CartTableData copyWith({
    String? idDrink,
    String? strDrink,
    Value<String?> strDrinkThumb = const Value.absent(),
    int? quantity,
    int? price,
  }) => CartTableData(
    idDrink: idDrink ?? this.idDrink,
    strDrink: strDrink ?? this.strDrink,
    strDrinkThumb: strDrinkThumb.present
        ? strDrinkThumb.value
        : this.strDrinkThumb,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
  );
  CartTableData copyWithCompanion(CartTableCompanion data) {
    return CartTableData(
      idDrink: data.idDrink.present ? data.idDrink.value : this.idDrink,
      strDrink: data.strDrink.present ? data.strDrink.value : this.strDrink,
      strDrinkThumb: data.strDrinkThumb.present
          ? data.strDrinkThumb.value
          : this.strDrinkThumb,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartTableData(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idDrink, strDrink, strDrinkThumb, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartTableData &&
          other.idDrink == this.idDrink &&
          other.strDrink == this.strDrink &&
          other.strDrinkThumb == this.strDrinkThumb &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class CartTableCompanion extends UpdateCompanion<CartTableData> {
  final Value<String> idDrink;
  final Value<String> strDrink;
  final Value<String?> strDrinkThumb;
  final Value<int> quantity;
  final Value<int> price;
  final Value<int> rowid;
  const CartTableCompanion({
    this.idDrink = const Value.absent(),
    this.strDrink = const Value.absent(),
    this.strDrinkThumb = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartTableCompanion.insert({
    required String idDrink,
    required String strDrink,
    this.strDrinkThumb = const Value.absent(),
    required int quantity,
    required int price,
    this.rowid = const Value.absent(),
  }) : idDrink = Value(idDrink),
       strDrink = Value(strDrink),
       quantity = Value(quantity),
       price = Value(price);
  static Insertable<CartTableData> custom({
    Expression<String>? idDrink,
    Expression<String>? strDrink,
    Expression<String>? strDrinkThumb,
    Expression<int>? quantity,
    Expression<int>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idDrink != null) 'id_drink': idDrink,
      if (strDrink != null) 'str_drink': strDrink,
      if (strDrinkThumb != null) 'str_drink_thumb': strDrinkThumb,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartTableCompanion copyWith({
    Value<String>? idDrink,
    Value<String>? strDrink,
    Value<String?>? strDrinkThumb,
    Value<int>? quantity,
    Value<int>? price,
    Value<int>? rowid,
  }) {
    return CartTableCompanion(
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDrink.present) {
      map['id_drink'] = Variable<String>(idDrink.value);
    }
    if (strDrink.present) {
      map['str_drink'] = Variable<String>(strDrink.value);
    }
    if (strDrinkThumb.present) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartTableCompanion(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderHistoryTableTable extends OrderHistoryTable
    with TableInfo<$OrderHistoryTableTable, OrderHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idDrinkMeta = const VerificationMeta(
    'idDrink',
  );
  @override
  late final GeneratedColumn<String> idDrink = GeneratedColumn<String>(
    'id_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkMeta = const VerificationMeta(
    'strDrink',
  );
  @override
  late final GeneratedColumn<String> strDrink = GeneratedColumn<String>(
    'str_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkThumbMeta = const VerificationMeta(
    'strDrinkThumb',
  );
  @override
  late final GeneratedColumn<String> strDrinkThumb = GeneratedColumn<String>(
    'str_drink_thumb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderedAtMeta = const VerificationMeta(
    'orderedAt',
  );
  @override
  late final GeneratedColumn<DateTime> orderedAt = GeneratedColumn<DateTime>(
    'ordered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idDrink,
    strDrink,
    strDrinkThumb,
    quantity,
    orderedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_drink')) {
      context.handle(
        _idDrinkMeta,
        idDrink.isAcceptableOrUnknown(data['id_drink']!, _idDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_idDrinkMeta);
    }
    if (data.containsKey('str_drink')) {
      context.handle(
        _strDrinkMeta,
        strDrink.isAcceptableOrUnknown(data['str_drink']!, _strDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_strDrinkMeta);
    }
    if (data.containsKey('str_drink_thumb')) {
      context.handle(
        _strDrinkThumbMeta,
        strDrinkThumb.isAcceptableOrUnknown(
          data['str_drink_thumb']!,
          _strDrinkThumbMeta,
        ),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('ordered_at')) {
      context.handle(
        _orderedAtMeta,
        orderedAt.isAcceptableOrUnknown(data['ordered_at']!, _orderedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderHistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_drink'],
      )!,
      strDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink'],
      )!,
      strDrinkThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink_thumb'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      orderedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ordered_at'],
      )!,
    );
  }

  @override
  $OrderHistoryTableTable createAlias(String alias) {
    return $OrderHistoryTableTable(attachedDatabase, alias);
  }
}

class OrderHistoryTableData extends DataClass
    implements Insertable<OrderHistoryTableData> {
  final int id;
  final String idDrink;
  final String strDrink;
  final String? strDrinkThumb;
  final int quantity;
  final DateTime orderedAt;
  const OrderHistoryTableData({
    required this.id,
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
    required this.quantity,
    required this.orderedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_drink'] = Variable<String>(idDrink);
    map['str_drink'] = Variable<String>(strDrink);
    if (!nullToAbsent || strDrinkThumb != null) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb);
    }
    map['quantity'] = Variable<int>(quantity);
    map['ordered_at'] = Variable<DateTime>(orderedAt);
    return map;
  }

  OrderHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return OrderHistoryTableCompanion(
      id: Value(id),
      idDrink: Value(idDrink),
      strDrink: Value(strDrink),
      strDrinkThumb: strDrinkThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkThumb),
      quantity: Value(quantity),
      orderedAt: Value(orderedAt),
    );
  }

  factory OrderHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      idDrink: serializer.fromJson<String>(json['idDrink']),
      strDrink: serializer.fromJson<String>(json['strDrink']),
      strDrinkThumb: serializer.fromJson<String?>(json['strDrinkThumb']),
      quantity: serializer.fromJson<int>(json['quantity']),
      orderedAt: serializer.fromJson<DateTime>(json['orderedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idDrink': serializer.toJson<String>(idDrink),
      'strDrink': serializer.toJson<String>(strDrink),
      'strDrinkThumb': serializer.toJson<String?>(strDrinkThumb),
      'quantity': serializer.toJson<int>(quantity),
      'orderedAt': serializer.toJson<DateTime>(orderedAt),
    };
  }

  OrderHistoryTableData copyWith({
    int? id,
    String? idDrink,
    String? strDrink,
    Value<String?> strDrinkThumb = const Value.absent(),
    int? quantity,
    DateTime? orderedAt,
  }) => OrderHistoryTableData(
    id: id ?? this.id,
    idDrink: idDrink ?? this.idDrink,
    strDrink: strDrink ?? this.strDrink,
    strDrinkThumb: strDrinkThumb.present
        ? strDrinkThumb.value
        : this.strDrinkThumb,
    quantity: quantity ?? this.quantity,
    orderedAt: orderedAt ?? this.orderedAt,
  );
  OrderHistoryTableData copyWithCompanion(OrderHistoryTableCompanion data) {
    return OrderHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      idDrink: data.idDrink.present ? data.idDrink.value : this.idDrink,
      strDrink: data.strDrink.present ? data.strDrink.value : this.strDrink,
      strDrinkThumb: data.strDrinkThumb.present
          ? data.strDrinkThumb.value
          : this.strDrinkThumb,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      orderedAt: data.orderedAt.present ? data.orderedAt.value : this.orderedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderHistoryTableData(')
          ..write('id: $id, ')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('quantity: $quantity, ')
          ..write('orderedAt: $orderedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idDrink, strDrink, strDrinkThumb, quantity, orderedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderHistoryTableData &&
          other.id == this.id &&
          other.idDrink == this.idDrink &&
          other.strDrink == this.strDrink &&
          other.strDrinkThumb == this.strDrinkThumb &&
          other.quantity == this.quantity &&
          other.orderedAt == this.orderedAt);
}

class OrderHistoryTableCompanion
    extends UpdateCompanion<OrderHistoryTableData> {
  final Value<int> id;
  final Value<String> idDrink;
  final Value<String> strDrink;
  final Value<String?> strDrinkThumb;
  final Value<int> quantity;
  final Value<DateTime> orderedAt;
  const OrderHistoryTableCompanion({
    this.id = const Value.absent(),
    this.idDrink = const Value.absent(),
    this.strDrink = const Value.absent(),
    this.strDrinkThumb = const Value.absent(),
    this.quantity = const Value.absent(),
    this.orderedAt = const Value.absent(),
  });
  OrderHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String idDrink,
    required String strDrink,
    this.strDrinkThumb = const Value.absent(),
    required int quantity,
    this.orderedAt = const Value.absent(),
  }) : idDrink = Value(idDrink),
       strDrink = Value(strDrink),
       quantity = Value(quantity);
  static Insertable<OrderHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? idDrink,
    Expression<String>? strDrink,
    Expression<String>? strDrinkThumb,
    Expression<int>? quantity,
    Expression<DateTime>? orderedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idDrink != null) 'id_drink': idDrink,
      if (strDrink != null) 'str_drink': strDrink,
      if (strDrinkThumb != null) 'str_drink_thumb': strDrinkThumb,
      if (quantity != null) 'quantity': quantity,
      if (orderedAt != null) 'ordered_at': orderedAt,
    });
  }

  OrderHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? idDrink,
    Value<String>? strDrink,
    Value<String?>? strDrinkThumb,
    Value<int>? quantity,
    Value<DateTime>? orderedAt,
  }) {
    return OrderHistoryTableCompanion(
      id: id ?? this.id,
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      quantity: quantity ?? this.quantity,
      orderedAt: orderedAt ?? this.orderedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDrink.present) {
      map['id_drink'] = Variable<String>(idDrink.value);
    }
    if (strDrink.present) {
      map['str_drink'] = Variable<String>(strDrink.value);
    }
    if (strDrinkThumb.present) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (orderedAt.present) {
      map['ordered_at'] = Variable<DateTime>(orderedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('quantity: $quantity, ')
          ..write('orderedAt: $orderedAt')
          ..write(')'))
        .toString();
  }
}

class $FavoriteTableTable extends FavoriteTable
    with TableInfo<$FavoriteTableTable, FavoriteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDrinkMeta = const VerificationMeta(
    'idDrink',
  );
  @override
  late final GeneratedColumn<String> idDrink = GeneratedColumn<String>(
    'id_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkMeta = const VerificationMeta(
    'strDrink',
  );
  @override
  late final GeneratedColumn<String> strDrink = GeneratedColumn<String>(
    'str_drink',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strDrinkThumbMeta = const VerificationMeta(
    'strDrinkThumb',
  );
  @override
  late final GeneratedColumn<String> strDrinkThumb = GeneratedColumn<String>(
    'str_drink_thumb',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strCategoryMeta = const VerificationMeta(
    'strCategory',
  );
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
    'str_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDrink,
    strDrink,
    strDrinkThumb,
    strCategory,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_drink')) {
      context.handle(
        _idDrinkMeta,
        idDrink.isAcceptableOrUnknown(data['id_drink']!, _idDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_idDrinkMeta);
    }
    if (data.containsKey('str_drink')) {
      context.handle(
        _strDrinkMeta,
        strDrink.isAcceptableOrUnknown(data['str_drink']!, _strDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_strDrinkMeta);
    }
    if (data.containsKey('str_drink_thumb')) {
      context.handle(
        _strDrinkThumbMeta,
        strDrinkThumb.isAcceptableOrUnknown(
          data['str_drink_thumb']!,
          _strDrinkThumbMeta,
        ),
      );
    }
    if (data.containsKey('str_category')) {
      context.handle(
        _strCategoryMeta,
        strCategory.isAcceptableOrUnknown(
          data['str_category']!,
          _strCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDrink};
  @override
  FavoriteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteTableData(
      idDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_drink'],
      )!,
      strDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink'],
      )!,
      strDrinkThumb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_drink_thumb'],
      ),
      strCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}str_category'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoriteTableTable createAlias(String alias) {
    return $FavoriteTableTable(attachedDatabase, alias);
  }
}

class FavoriteTableData extends DataClass
    implements Insertable<FavoriteTableData> {
  final String idDrink;
  final String strDrink;
  final String? strDrinkThumb;
  final String strCategory;
  final DateTime addedAt;
  const FavoriteTableData({
    required this.idDrink,
    required this.strDrink,
    this.strDrinkThumb,
    required this.strCategory,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_drink'] = Variable<String>(idDrink);
    map['str_drink'] = Variable<String>(strDrink);
    if (!nullToAbsent || strDrinkThumb != null) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb);
    }
    map['str_category'] = Variable<String>(strCategory);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoriteTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteTableCompanion(
      idDrink: Value(idDrink),
      strDrink: Value(strDrink),
      strDrinkThumb: strDrinkThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkThumb),
      strCategory: Value(strCategory),
      addedAt: Value(addedAt),
    );
  }

  factory FavoriteTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteTableData(
      idDrink: serializer.fromJson<String>(json['idDrink']),
      strDrink: serializer.fromJson<String>(json['strDrink']),
      strDrinkThumb: serializer.fromJson<String?>(json['strDrinkThumb']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDrink': serializer.toJson<String>(idDrink),
      'strDrink': serializer.toJson<String>(strDrink),
      'strDrinkThumb': serializer.toJson<String?>(strDrinkThumb),
      'strCategory': serializer.toJson<String>(strCategory),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  FavoriteTableData copyWith({
    String? idDrink,
    String? strDrink,
    Value<String?> strDrinkThumb = const Value.absent(),
    String? strCategory,
    DateTime? addedAt,
  }) => FavoriteTableData(
    idDrink: idDrink ?? this.idDrink,
    strDrink: strDrink ?? this.strDrink,
    strDrinkThumb: strDrinkThumb.present
        ? strDrinkThumb.value
        : this.strDrinkThumb,
    strCategory: strCategory ?? this.strCategory,
    addedAt: addedAt ?? this.addedAt,
  );
  FavoriteTableData copyWithCompanion(FavoriteTableCompanion data) {
    return FavoriteTableData(
      idDrink: data.idDrink.present ? data.idDrink.value : this.idDrink,
      strDrink: data.strDrink.present ? data.strDrink.value : this.strDrink,
      strDrinkThumb: data.strDrinkThumb.present
          ? data.strDrinkThumb.value
          : this.strDrinkThumb,
      strCategory: data.strCategory.present
          ? data.strCategory.value
          : this.strCategory,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTableData(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idDrink, strDrink, strDrinkThumb, strCategory, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTableData &&
          other.idDrink == this.idDrink &&
          other.strDrink == this.strDrink &&
          other.strDrinkThumb == this.strDrinkThumb &&
          other.strCategory == this.strCategory &&
          other.addedAt == this.addedAt);
}

class FavoriteTableCompanion extends UpdateCompanion<FavoriteTableData> {
  final Value<String> idDrink;
  final Value<String> strDrink;
  final Value<String?> strDrinkThumb;
  final Value<String> strCategory;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoriteTableCompanion({
    this.idDrink = const Value.absent(),
    this.strDrink = const Value.absent(),
    this.strDrinkThumb = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteTableCompanion.insert({
    required String idDrink,
    required String strDrink,
    this.strDrinkThumb = const Value.absent(),
    required String strCategory,
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idDrink = Value(idDrink),
       strDrink = Value(strDrink),
       strCategory = Value(strCategory);
  static Insertable<FavoriteTableData> custom({
    Expression<String>? idDrink,
    Expression<String>? strDrink,
    Expression<String>? strDrinkThumb,
    Expression<String>? strCategory,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idDrink != null) 'id_drink': idDrink,
      if (strDrink != null) 'str_drink': strDrink,
      if (strDrinkThumb != null) 'str_drink_thumb': strDrinkThumb,
      if (strCategory != null) 'str_category': strCategory,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteTableCompanion copyWith({
    Value<String>? idDrink,
    Value<String>? strDrink,
    Value<String?>? strDrinkThumb,
    Value<String>? strCategory,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return FavoriteTableCompanion(
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      strCategory: strCategory ?? this.strCategory,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDrink.present) {
      map['id_drink'] = Variable<String>(idDrink.value);
    }
    if (strDrink.present) {
      map['str_drink'] = Variable<String>(strDrink.value);
    }
    if (strDrinkThumb.present) {
      map['str_drink_thumb'] = Variable<String>(strDrinkThumb.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTableCompanion(')
          ..write('idDrink: $idDrink, ')
          ..write('strDrink: $strDrink, ')
          ..write('strDrinkThumb: $strDrinkThumb, ')
          ..write('strCategory: $strCategory, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlcoholTableTable alcoholTable = $AlcoholTableTable(this);
  late final $AlcoholDetailTableTable alcoholDetailTable =
      $AlcoholDetailTableTable(this);
  late final $CartTableTable cartTable = $CartTableTable(this);
  late final $OrderHistoryTableTable orderHistoryTable =
      $OrderHistoryTableTable(this);
  late final $FavoriteTableTable favoriteTable = $FavoriteTableTable(this);
  late final AlcoholDao alcoholDao = AlcoholDao(this as AppDatabase);
  late final CartDao cartDao = CartDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    alcoholTable,
    alcoholDetailTable,
    cartTable,
    orderHistoryTable,
    favoriteTable,
  ];
}

typedef $$AlcoholTableTableCreateCompanionBuilder =
    AlcoholTableCompanion Function({
      required String idDrink,
      required String strDrink,
      Value<String?> strDrinkThumb,
      required String strCategory,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$AlcoholTableTableUpdateCompanionBuilder =
    AlcoholTableCompanion Function({
      Value<String> idDrink,
      Value<String> strDrink,
      Value<String?> strDrinkThumb,
      Value<String> strCategory,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$AlcoholTableTableFilterComposer
    extends Composer<_$AppDatabase, $AlcoholTableTable> {
  $$AlcoholTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlcoholTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AlcoholTableTable> {
  $$AlcoholTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlcoholTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlcoholTableTable> {
  $$AlcoholTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idDrink =>
      $composableBuilder(column: $table.idDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrink =>
      $composableBuilder(column: $table.strDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$AlcoholTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlcoholTableTable,
          AlcoholTableData,
          $$AlcoholTableTableFilterComposer,
          $$AlcoholTableTableOrderingComposer,
          $$AlcoholTableTableAnnotationComposer,
          $$AlcoholTableTableCreateCompanionBuilder,
          $$AlcoholTableTableUpdateCompanionBuilder,
          (
            AlcoholTableData,
            BaseReferences<_$AppDatabase, $AlcoholTableTable, AlcoholTableData>,
          ),
          AlcoholTableData,
          PrefetchHooks Function()
        > {
  $$AlcoholTableTableTableManager(_$AppDatabase db, $AlcoholTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlcoholTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlcoholTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlcoholTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idDrink = const Value.absent(),
                Value<String> strDrink = const Value.absent(),
                Value<String?> strDrinkThumb = const Value.absent(),
                Value<String> strCategory = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlcoholTableCompanion(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idDrink,
                required String strDrink,
                Value<String?> strDrinkThumb = const Value.absent(),
                required String strCategory,
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlcoholTableCompanion.insert(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlcoholTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlcoholTableTable,
      AlcoholTableData,
      $$AlcoholTableTableFilterComposer,
      $$AlcoholTableTableOrderingComposer,
      $$AlcoholTableTableAnnotationComposer,
      $$AlcoholTableTableCreateCompanionBuilder,
      $$AlcoholTableTableUpdateCompanionBuilder,
      (
        AlcoholTableData,
        BaseReferences<_$AppDatabase, $AlcoholTableTable, AlcoholTableData>,
      ),
      AlcoholTableData,
      PrefetchHooks Function()
    >;
typedef $$AlcoholDetailTableTableCreateCompanionBuilder =
    AlcoholDetailTableCompanion Function({
      required String idDrink,
      required String strDrink,
      Value<String?> strDrinkThumb,
      required String strCategory,
      required String strGlass,
      required String strAlcoholic,
      required String strInstructions,
      required List<IngredientTableItem> ingredients,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$AlcoholDetailTableTableUpdateCompanionBuilder =
    AlcoholDetailTableCompanion Function({
      Value<String> idDrink,
      Value<String> strDrink,
      Value<String?> strDrinkThumb,
      Value<String> strCategory,
      Value<String> strGlass,
      Value<String> strAlcoholic,
      Value<String> strInstructions,
      Value<List<IngredientTableItem>> ingredients,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$AlcoholDetailTableTableFilterComposer
    extends Composer<_$AppDatabase, $AlcoholDetailTableTable> {
  $$AlcoholDetailTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strGlass => $composableBuilder(
    column: $table.strGlass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strAlcoholic => $composableBuilder(
    column: $table.strAlcoholic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strInstructions => $composableBuilder(
    column: $table.strInstructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<IngredientTableItem>,
    List<IngredientTableItem>,
    String
  >
  get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlcoholDetailTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AlcoholDetailTableTable> {
  $$AlcoholDetailTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strGlass => $composableBuilder(
    column: $table.strGlass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strAlcoholic => $composableBuilder(
    column: $table.strAlcoholic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strInstructions => $composableBuilder(
    column: $table.strInstructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlcoholDetailTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlcoholDetailTableTable> {
  $$AlcoholDetailTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idDrink =>
      $composableBuilder(column: $table.idDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrink =>
      $composableBuilder(column: $table.strDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strGlass =>
      $composableBuilder(column: $table.strGlass, builder: (column) => column);

  GeneratedColumn<String> get strAlcoholic => $composableBuilder(
    column: $table.strAlcoholic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strInstructions => $composableBuilder(
    column: $table.strInstructions,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<IngredientTableItem>, String>
  get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$AlcoholDetailTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlcoholDetailTableTable,
          AlcoholDetailTableData,
          $$AlcoholDetailTableTableFilterComposer,
          $$AlcoholDetailTableTableOrderingComposer,
          $$AlcoholDetailTableTableAnnotationComposer,
          $$AlcoholDetailTableTableCreateCompanionBuilder,
          $$AlcoholDetailTableTableUpdateCompanionBuilder,
          (
            AlcoholDetailTableData,
            BaseReferences<
              _$AppDatabase,
              $AlcoholDetailTableTable,
              AlcoholDetailTableData
            >,
          ),
          AlcoholDetailTableData,
          PrefetchHooks Function()
        > {
  $$AlcoholDetailTableTableTableManager(
    _$AppDatabase db,
    $AlcoholDetailTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlcoholDetailTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlcoholDetailTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlcoholDetailTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idDrink = const Value.absent(),
                Value<String> strDrink = const Value.absent(),
                Value<String?> strDrinkThumb = const Value.absent(),
                Value<String> strCategory = const Value.absent(),
                Value<String> strGlass = const Value.absent(),
                Value<String> strAlcoholic = const Value.absent(),
                Value<String> strInstructions = const Value.absent(),
                Value<List<IngredientTableItem>> ingredients =
                    const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlcoholDetailTableCompanion(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                strGlass: strGlass,
                strAlcoholic: strAlcoholic,
                strInstructions: strInstructions,
                ingredients: ingredients,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idDrink,
                required String strDrink,
                Value<String?> strDrinkThumb = const Value.absent(),
                required String strCategory,
                required String strGlass,
                required String strAlcoholic,
                required String strInstructions,
                required List<IngredientTableItem> ingredients,
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlcoholDetailTableCompanion.insert(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                strGlass: strGlass,
                strAlcoholic: strAlcoholic,
                strInstructions: strInstructions,
                ingredients: ingredients,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlcoholDetailTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlcoholDetailTableTable,
      AlcoholDetailTableData,
      $$AlcoholDetailTableTableFilterComposer,
      $$AlcoholDetailTableTableOrderingComposer,
      $$AlcoholDetailTableTableAnnotationComposer,
      $$AlcoholDetailTableTableCreateCompanionBuilder,
      $$AlcoholDetailTableTableUpdateCompanionBuilder,
      (
        AlcoholDetailTableData,
        BaseReferences<
          _$AppDatabase,
          $AlcoholDetailTableTable,
          AlcoholDetailTableData
        >,
      ),
      AlcoholDetailTableData,
      PrefetchHooks Function()
    >;
typedef $$CartTableTableCreateCompanionBuilder =
    CartTableCompanion Function({
      required String idDrink,
      required String strDrink,
      Value<String?> strDrinkThumb,
      required int quantity,
      required int price,
      Value<int> rowid,
    });
typedef $$CartTableTableUpdateCompanionBuilder =
    CartTableCompanion Function({
      Value<String> idDrink,
      Value<String> strDrink,
      Value<String?> strDrinkThumb,
      Value<int> quantity,
      Value<int> price,
      Value<int> rowid,
    });

class $$CartTableTableFilterComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idDrink =>
      $composableBuilder(column: $table.idDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrink =>
      $composableBuilder(column: $table.strDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$CartTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartTableTable,
          CartTableData,
          $$CartTableTableFilterComposer,
          $$CartTableTableOrderingComposer,
          $$CartTableTableAnnotationComposer,
          $$CartTableTableCreateCompanionBuilder,
          $$CartTableTableUpdateCompanionBuilder,
          (
            CartTableData,
            BaseReferences<_$AppDatabase, $CartTableTable, CartTableData>,
          ),
          CartTableData,
          PrefetchHooks Function()
        > {
  $$CartTableTableTableManager(_$AppDatabase db, $CartTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idDrink = const Value.absent(),
                Value<String> strDrink = const Value.absent(),
                Value<String?> strDrinkThumb = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CartTableCompanion(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                quantity: quantity,
                price: price,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idDrink,
                required String strDrink,
                Value<String?> strDrinkThumb = const Value.absent(),
                required int quantity,
                required int price,
                Value<int> rowid = const Value.absent(),
              }) => CartTableCompanion.insert(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                quantity: quantity,
                price: price,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartTableTable,
      CartTableData,
      $$CartTableTableFilterComposer,
      $$CartTableTableOrderingComposer,
      $$CartTableTableAnnotationComposer,
      $$CartTableTableCreateCompanionBuilder,
      $$CartTableTableUpdateCompanionBuilder,
      (
        CartTableData,
        BaseReferences<_$AppDatabase, $CartTableTable, CartTableData>,
      ),
      CartTableData,
      PrefetchHooks Function()
    >;
typedef $$OrderHistoryTableTableCreateCompanionBuilder =
    OrderHistoryTableCompanion Function({
      Value<int> id,
      required String idDrink,
      required String strDrink,
      Value<String?> strDrinkThumb,
      required int quantity,
      Value<DateTime> orderedAt,
    });
typedef $$OrderHistoryTableTableUpdateCompanionBuilder =
    OrderHistoryTableCompanion Function({
      Value<int> id,
      Value<String> idDrink,
      Value<String> strDrink,
      Value<String?> strDrinkThumb,
      Value<int> quantity,
      Value<DateTime> orderedAt,
    });

class $$OrderHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderHistoryTableTable> {
  $$OrderHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderedAt => $composableBuilder(
    column: $table.orderedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderHistoryTableTable> {
  $$OrderHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderedAt => $composableBuilder(
    column: $table.orderedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderHistoryTableTable> {
  $$OrderHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idDrink =>
      $composableBuilder(column: $table.idDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrink =>
      $composableBuilder(column: $table.strDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get orderedAt =>
      $composableBuilder(column: $table.orderedAt, builder: (column) => column);
}

class $$OrderHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderHistoryTableTable,
          OrderHistoryTableData,
          $$OrderHistoryTableTableFilterComposer,
          $$OrderHistoryTableTableOrderingComposer,
          $$OrderHistoryTableTableAnnotationComposer,
          $$OrderHistoryTableTableCreateCompanionBuilder,
          $$OrderHistoryTableTableUpdateCompanionBuilder,
          (
            OrderHistoryTableData,
            BaseReferences<
              _$AppDatabase,
              $OrderHistoryTableTable,
              OrderHistoryTableData
            >,
          ),
          OrderHistoryTableData,
          PrefetchHooks Function()
        > {
  $$OrderHistoryTableTableTableManager(
    _$AppDatabase db,
    $OrderHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> idDrink = const Value.absent(),
                Value<String> strDrink = const Value.absent(),
                Value<String?> strDrinkThumb = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<DateTime> orderedAt = const Value.absent(),
              }) => OrderHistoryTableCompanion(
                id: id,
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                quantity: quantity,
                orderedAt: orderedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String idDrink,
                required String strDrink,
                Value<String?> strDrinkThumb = const Value.absent(),
                required int quantity,
                Value<DateTime> orderedAt = const Value.absent(),
              }) => OrderHistoryTableCompanion.insert(
                id: id,
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                quantity: quantity,
                orderedAt: orderedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderHistoryTableTable,
      OrderHistoryTableData,
      $$OrderHistoryTableTableFilterComposer,
      $$OrderHistoryTableTableOrderingComposer,
      $$OrderHistoryTableTableAnnotationComposer,
      $$OrderHistoryTableTableCreateCompanionBuilder,
      $$OrderHistoryTableTableUpdateCompanionBuilder,
      (
        OrderHistoryTableData,
        BaseReferences<
          _$AppDatabase,
          $OrderHistoryTableTable,
          OrderHistoryTableData
        >,
      ),
      OrderHistoryTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoriteTableTableCreateCompanionBuilder =
    FavoriteTableCompanion Function({
      required String idDrink,
      required String strDrink,
      Value<String?> strDrinkThumb,
      required String strCategory,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });
typedef $$FavoriteTableTableUpdateCompanionBuilder =
    FavoriteTableCompanion Function({
      Value<String> idDrink,
      Value<String> strDrink,
      Value<String?> strDrinkThumb,
      Value<String> strCategory,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

class $$FavoriteTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteTableTable> {
  $$FavoriteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteTableTable> {
  $$FavoriteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idDrink => $composableBuilder(
    column: $table.idDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrink => $composableBuilder(
    column: $table.strDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteTableTable> {
  $$FavoriteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idDrink =>
      $composableBuilder(column: $table.idDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrink =>
      $composableBuilder(column: $table.strDrink, builder: (column) => column);

  GeneratedColumn<String> get strDrinkThumb => $composableBuilder(
    column: $table.strDrinkThumb,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strCategory => $composableBuilder(
    column: $table.strCategory,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoriteTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteTableTable,
          FavoriteTableData,
          $$FavoriteTableTableFilterComposer,
          $$FavoriteTableTableOrderingComposer,
          $$FavoriteTableTableAnnotationComposer,
          $$FavoriteTableTableCreateCompanionBuilder,
          $$FavoriteTableTableUpdateCompanionBuilder,
          (
            FavoriteTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoriteTableTable,
              FavoriteTableData
            >,
          ),
          FavoriteTableData,
          PrefetchHooks Function()
        > {
  $$FavoriteTableTableTableManager(_$AppDatabase db, $FavoriteTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idDrink = const Value.absent(),
                Value<String> strDrink = const Value.absent(),
                Value<String?> strDrinkThumb = const Value.absent(),
                Value<String> strCategory = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTableCompanion(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idDrink,
                required String strDrink,
                Value<String?> strDrinkThumb = const Value.absent(),
                required String strCategory,
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTableCompanion.insert(
                idDrink: idDrink,
                strDrink: strDrink,
                strDrinkThumb: strDrinkThumb,
                strCategory: strCategory,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteTableTable,
      FavoriteTableData,
      $$FavoriteTableTableFilterComposer,
      $$FavoriteTableTableOrderingComposer,
      $$FavoriteTableTableAnnotationComposer,
      $$FavoriteTableTableCreateCompanionBuilder,
      $$FavoriteTableTableUpdateCompanionBuilder,
      (
        FavoriteTableData,
        BaseReferences<_$AppDatabase, $FavoriteTableTable, FavoriteTableData>,
      ),
      FavoriteTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlcoholTableTableTableManager get alcoholTable =>
      $$AlcoholTableTableTableManager(_db, _db.alcoholTable);
  $$AlcoholDetailTableTableTableManager get alcoholDetailTable =>
      $$AlcoholDetailTableTableTableManager(_db, _db.alcoholDetailTable);
  $$CartTableTableTableManager get cartTable =>
      $$CartTableTableTableManager(_db, _db.cartTable);
  $$OrderHistoryTableTableTableManager get orderHistoryTable =>
      $$OrderHistoryTableTableTableManager(_db, _db.orderHistoryTable);
  $$FavoriteTableTableTableManager get favoriteTable =>
      $$FavoriteTableTableTableManager(_db, _db.favoriteTable);
}
