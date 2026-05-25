// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RoisTable extends Rois with TableInfo<$RoisTable, Roi> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isOfflineCachedMeta = const VerificationMeta(
    'isOfflineCached',
  );
  @override
  late final GeneratedColumn<int> isOfflineCached = GeneratedColumn<int>(
    'is_offline_cached',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    isOfflineCached,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rois';
  @override
  VerificationContext validateIntegrity(
    Insertable<Roi> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_offline_cached')) {
      context.handle(
        _isOfflineCachedMeta,
        isOfflineCached.isAcceptableOrUnknown(
          data['is_offline_cached']!,
          _isOfflineCachedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Roi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Roi(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isOfflineCached: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_offline_cached'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoisTable createAlias(String alias) {
    return $RoisTable(attachedDatabase, alias);
  }
}

class Roi extends DataClass implements Insertable<Roi> {
  final String id;
  final String name;
  final String? description;
  final int isOfflineCached;
  final int createdAt;
  const Roi({
    required this.id,
    required this.name,
    this.description,
    required this.isOfflineCached,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_offline_cached'] = Variable<int>(isOfflineCached);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  RoisCompanion toCompanion(bool nullToAbsent) {
    return RoisCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isOfflineCached: Value(isOfflineCached),
      createdAt: Value(createdAt),
    );
  }

  factory Roi.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Roi(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isOfflineCached: serializer.fromJson<int>(json['isOfflineCached']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isOfflineCached': serializer.toJson<int>(isOfflineCached),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Roi copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    int? isOfflineCached,
    int? createdAt,
  }) => Roi(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isOfflineCached: isOfflineCached ?? this.isOfflineCached,
    createdAt: createdAt ?? this.createdAt,
  );
  Roi copyWithCompanion(RoisCompanion data) {
    return Roi(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isOfflineCached: data.isOfflineCached.present
          ? data.isOfflineCached.value
          : this.isOfflineCached,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Roi(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isOfflineCached: $isOfflineCached, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, isOfflineCached, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Roi &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isOfflineCached == this.isOfflineCached &&
          other.createdAt == this.createdAt);
}

class RoisCompanion extends UpdateCompanion<Roi> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> isOfflineCached;
  final Value<int> createdAt;
  final Value<int> rowid;
  const RoisCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isOfflineCached = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoisCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.isOfflineCached = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Roi> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? isOfflineCached,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isOfflineCached != null) 'is_offline_cached': isOfflineCached,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoisCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? isOfflineCached,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return RoisCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isOfflineCached: isOfflineCached ?? this.isOfflineCached,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isOfflineCached.present) {
      map['is_offline_cached'] = Variable<int>(isOfflineCached.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoisCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isOfflineCached: $isOfflineCached, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PoisTable extends Pois with TableInfo<$PoisTable, Poi> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roiIdMeta = const VerificationMeta('roiId');
  @override
  late final GeneratedColumn<String> roiId = GeneratedColumn<String>(
    'roi_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rois (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessHoursMeta = const VerificationMeta(
    'businessHours',
  );
  @override
  late final GeneratedColumn<String> businessHours = GeneratedColumn<String>(
    'business_hours',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactInfoMeta = const VerificationMeta(
    'contactInfo',
  );
  @override
  late final GeneratedColumn<String> contactInfo = GeneratedColumn<String>(
    'contact_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverImageUriMeta = const VerificationMeta(
    'coverImageUri',
  );
  @override
  late final GeneratedColumn<String> coverImageUri = GeneratedColumn<String>(
    'cover_image_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _animeSeriesRefMeta = const VerificationMeta(
    'animeSeriesRef',
  );
  @override
  late final GeneratedColumn<String> animeSeriesRef = GeneratedColumn<String>(
    'anime_series_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roiId,
    name,
    description,
    address,
    lat,
    lng,
    businessHours,
    contactInfo,
    coverImageUri,
    tags,
    animeSeriesRef,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pois';
  @override
  VerificationContext validateIntegrity(
    Insertable<Poi> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roi_id')) {
      context.handle(
        _roiIdMeta,
        roiId.isAcceptableOrUnknown(data['roi_id']!, _roiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roiIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('business_hours')) {
      context.handle(
        _businessHoursMeta,
        businessHours.isAcceptableOrUnknown(
          data['business_hours']!,
          _businessHoursMeta,
        ),
      );
    }
    if (data.containsKey('contact_info')) {
      context.handle(
        _contactInfoMeta,
        contactInfo.isAcceptableOrUnknown(
          data['contact_info']!,
          _contactInfoMeta,
        ),
      );
    }
    if (data.containsKey('cover_image_uri')) {
      context.handle(
        _coverImageUriMeta,
        coverImageUri.isAcceptableOrUnknown(
          data['cover_image_uri']!,
          _coverImageUriMeta,
        ),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('anime_series_ref')) {
      context.handle(
        _animeSeriesRefMeta,
        animeSeriesRef.isAcceptableOrUnknown(
          data['anime_series_ref']!,
          _animeSeriesRefMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Poi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Poi(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roi_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      businessHours: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_hours'],
      ),
      contactInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_info'],
      ),
      coverImageUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_uri'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      animeSeriesRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anime_series_ref'],
      ),
    );
  }

  @override
  $PoisTable createAlias(String alias) {
    return $PoisTable(attachedDatabase, alias);
  }
}

class Poi extends DataClass implements Insertable<Poi> {
  final String id;
  final String roiId;
  final String name;
  final String? description;
  final String? address;
  final double lat;
  final double lng;
  final String? businessHours;
  final String? contactInfo;
  final String? coverImageUri;
  final String? tags;
  final String? animeSeriesRef;
  const Poi({
    required this.id,
    required this.roiId,
    required this.name,
    this.description,
    this.address,
    required this.lat,
    required this.lng,
    this.businessHours,
    this.contactInfo,
    this.coverImageUri,
    this.tags,
    this.animeSeriesRef,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roi_id'] = Variable<String>(roiId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    if (!nullToAbsent || businessHours != null) {
      map['business_hours'] = Variable<String>(businessHours);
    }
    if (!nullToAbsent || contactInfo != null) {
      map['contact_info'] = Variable<String>(contactInfo);
    }
    if (!nullToAbsent || coverImageUri != null) {
      map['cover_image_uri'] = Variable<String>(coverImageUri);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || animeSeriesRef != null) {
      map['anime_series_ref'] = Variable<String>(animeSeriesRef);
    }
    return map;
  }

  PoisCompanion toCompanion(bool nullToAbsent) {
    return PoisCompanion(
      id: Value(id),
      roiId: Value(roiId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      lat: Value(lat),
      lng: Value(lng),
      businessHours: businessHours == null && nullToAbsent
          ? const Value.absent()
          : Value(businessHours),
      contactInfo: contactInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(contactInfo),
      coverImageUri: coverImageUri == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageUri),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      animeSeriesRef: animeSeriesRef == null && nullToAbsent
          ? const Value.absent()
          : Value(animeSeriesRef),
    );
  }

  factory Poi.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Poi(
      id: serializer.fromJson<String>(json['id']),
      roiId: serializer.fromJson<String>(json['roiId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      address: serializer.fromJson<String?>(json['address']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      businessHours: serializer.fromJson<String?>(json['businessHours']),
      contactInfo: serializer.fromJson<String?>(json['contactInfo']),
      coverImageUri: serializer.fromJson<String?>(json['coverImageUri']),
      tags: serializer.fromJson<String?>(json['tags']),
      animeSeriesRef: serializer.fromJson<String?>(json['animeSeriesRef']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roiId': serializer.toJson<String>(roiId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'address': serializer.toJson<String?>(address),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'businessHours': serializer.toJson<String?>(businessHours),
      'contactInfo': serializer.toJson<String?>(contactInfo),
      'coverImageUri': serializer.toJson<String?>(coverImageUri),
      'tags': serializer.toJson<String?>(tags),
      'animeSeriesRef': serializer.toJson<String?>(animeSeriesRef),
    };
  }

  Poi copyWith({
    String? id,
    String? roiId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> address = const Value.absent(),
    double? lat,
    double? lng,
    Value<String?> businessHours = const Value.absent(),
    Value<String?> contactInfo = const Value.absent(),
    Value<String?> coverImageUri = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    Value<String?> animeSeriesRef = const Value.absent(),
  }) => Poi(
    id: id ?? this.id,
    roiId: roiId ?? this.roiId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    address: address.present ? address.value : this.address,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    businessHours: businessHours.present
        ? businessHours.value
        : this.businessHours,
    contactInfo: contactInfo.present ? contactInfo.value : this.contactInfo,
    coverImageUri: coverImageUri.present
        ? coverImageUri.value
        : this.coverImageUri,
    tags: tags.present ? tags.value : this.tags,
    animeSeriesRef: animeSeriesRef.present
        ? animeSeriesRef.value
        : this.animeSeriesRef,
  );
  Poi copyWithCompanion(PoisCompanion data) {
    return Poi(
      id: data.id.present ? data.id.value : this.id,
      roiId: data.roiId.present ? data.roiId.value : this.roiId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      address: data.address.present ? data.address.value : this.address,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      businessHours: data.businessHours.present
          ? data.businessHours.value
          : this.businessHours,
      contactInfo: data.contactInfo.present
          ? data.contactInfo.value
          : this.contactInfo,
      coverImageUri: data.coverImageUri.present
          ? data.coverImageUri.value
          : this.coverImageUri,
      tags: data.tags.present ? data.tags.value : this.tags,
      animeSeriesRef: data.animeSeriesRef.present
          ? data.animeSeriesRef.value
          : this.animeSeriesRef,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Poi(')
          ..write('id: $id, ')
          ..write('roiId: $roiId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('businessHours: $businessHours, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('coverImageUri: $coverImageUri, ')
          ..write('tags: $tags, ')
          ..write('animeSeriesRef: $animeSeriesRef')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roiId,
    name,
    description,
    address,
    lat,
    lng,
    businessHours,
    contactInfo,
    coverImageUri,
    tags,
    animeSeriesRef,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Poi &&
          other.id == this.id &&
          other.roiId == this.roiId &&
          other.name == this.name &&
          other.description == this.description &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.businessHours == this.businessHours &&
          other.contactInfo == this.contactInfo &&
          other.coverImageUri == this.coverImageUri &&
          other.tags == this.tags &&
          other.animeSeriesRef == this.animeSeriesRef);
}

class PoisCompanion extends UpdateCompanion<Poi> {
  final Value<String> id;
  final Value<String> roiId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> address;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String?> businessHours;
  final Value<String?> contactInfo;
  final Value<String?> coverImageUri;
  final Value<String?> tags;
  final Value<String?> animeSeriesRef;
  final Value<int> rowid;
  const PoisCompanion({
    this.id = const Value.absent(),
    this.roiId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.businessHours = const Value.absent(),
    this.contactInfo = const Value.absent(),
    this.coverImageUri = const Value.absent(),
    this.tags = const Value.absent(),
    this.animeSeriesRef = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PoisCompanion.insert({
    required String id,
    required String roiId,
    required String name,
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    required double lat,
    required double lng,
    this.businessHours = const Value.absent(),
    this.contactInfo = const Value.absent(),
    this.coverImageUri = const Value.absent(),
    this.tags = const Value.absent(),
    this.animeSeriesRef = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roiId = Value(roiId),
       name = Value(name),
       lat = Value(lat),
       lng = Value(lng);
  static Insertable<Poi> custom({
    Expression<String>? id,
    Expression<String>? roiId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? address,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? businessHours,
    Expression<String>? contactInfo,
    Expression<String>? coverImageUri,
    Expression<String>? tags,
    Expression<String>? animeSeriesRef,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roiId != null) 'roi_id': roiId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (businessHours != null) 'business_hours': businessHours,
      if (contactInfo != null) 'contact_info': contactInfo,
      if (coverImageUri != null) 'cover_image_uri': coverImageUri,
      if (tags != null) 'tags': tags,
      if (animeSeriesRef != null) 'anime_series_ref': animeSeriesRef,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PoisCompanion copyWith({
    Value<String>? id,
    Value<String>? roiId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? address,
    Value<double>? lat,
    Value<double>? lng,
    Value<String?>? businessHours,
    Value<String?>? contactInfo,
    Value<String?>? coverImageUri,
    Value<String?>? tags,
    Value<String?>? animeSeriesRef,
    Value<int>? rowid,
  }) {
    return PoisCompanion(
      id: id ?? this.id,
      roiId: roiId ?? this.roiId,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      businessHours: businessHours ?? this.businessHours,
      contactInfo: contactInfo ?? this.contactInfo,
      coverImageUri: coverImageUri ?? this.coverImageUri,
      tags: tags ?? this.tags,
      animeSeriesRef: animeSeriesRef ?? this.animeSeriesRef,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roiId.present) {
      map['roi_id'] = Variable<String>(roiId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (businessHours.present) {
      map['business_hours'] = Variable<String>(businessHours.value);
    }
    if (contactInfo.present) {
      map['contact_info'] = Variable<String>(contactInfo.value);
    }
    if (coverImageUri.present) {
      map['cover_image_uri'] = Variable<String>(coverImageUri.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (animeSeriesRef.present) {
      map['anime_series_ref'] = Variable<String>(animeSeriesRef.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoisCompanion(')
          ..write('id: $id, ')
          ..write('roiId: $roiId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('businessHours: $businessHours, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('coverImageUri: $coverImageUri, ')
          ..write('tags: $tags, ')
          ..write('animeSeriesRef: $animeSeriesRef, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimeChunksTable extends TimeChunks
    with TableInfo<$TimeChunksTable, TimeChunk> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeChunksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<String> poiId = GeneratedColumn<String>(
    'poi_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pois (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('backlog'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poiId,
    date,
    startTime,
    endTime,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'time_chunks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimeChunk> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('poi_id')) {
      context.handle(
        _poiIdMeta,
        poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poiIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeChunk map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeChunk(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poi_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_time'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $TimeChunksTable createAlias(String alias) {
    return $TimeChunksTable(attachedDatabase, alias);
  }
}

class TimeChunk extends DataClass implements Insertable<TimeChunk> {
  final String id;
  final String poiId;
  final String? date;
  final String? startTime;
  final String? endTime;
  final String status;
  const TimeChunk({
    required this.id,
    required this.poiId,
    this.date,
    this.startTime,
    this.endTime,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['poi_id'] = Variable<String>(poiId);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String>(endTime);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  TimeChunksCompanion toCompanion(bool nullToAbsent) {
    return TimeChunksCompanion(
      id: Value(id),
      poiId: Value(poiId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
    );
  }

  factory TimeChunk.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeChunk(
      id: serializer.fromJson<String>(json['id']),
      poiId: serializer.fromJson<String>(json['poiId']),
      date: serializer.fromJson<String?>(json['date']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poiId': serializer.toJson<String>(poiId),
      'date': serializer.toJson<String?>(date),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'status': serializer.toJson<String>(status),
    };
  }

  TimeChunk copyWith({
    String? id,
    String? poiId,
    Value<String?> date = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    String? status,
  }) => TimeChunk(
    id: id ?? this.id,
    poiId: poiId ?? this.poiId,
    date: date.present ? date.value : this.date,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
  );
  TimeChunk copyWithCompanion(TimeChunksCompanion data) {
    return TimeChunk(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      date: data.date.present ? data.date.value : this.date,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeChunk(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, poiId, date, startTime, endTime, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeChunk &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status);
}

class TimeChunksCompanion extends UpdateCompanion<TimeChunk> {
  final Value<String> id;
  final Value<String> poiId;
  final Value<String?> date;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<String> status;
  final Value<int> rowid;
  const TimeChunksCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimeChunksCompanion.insert({
    required String id,
    required String poiId,
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poiId = Value(poiId);
  static Insertable<TimeChunk> custom({
    Expression<String>? id,
    Expression<String>? poiId,
    Expression<String>? date,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimeChunksCompanion copyWith({
    Value<String>? id,
    Value<String>? poiId,
    Value<String?>? date,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return TimeChunksCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poiId.present) {
      map['poi_id'] = Variable<String>(poiId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeChunksCompanion(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReferenceImagesTable extends ReferenceImages
    with TableInfo<$ReferenceImagesTable, ReferenceImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferenceImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<String> poiId = GeneratedColumn<String>(
    'poi_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pois (id)',
    ),
  );
  static const VerificationMeta _localUriMeta = const VerificationMeta(
    'localUri',
  );
  @override
  late final GeneratedColumn<String> localUri = GeneratedColumn<String>(
    'local_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteUrlMeta = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poiId,
    localUri,
    remoteUrl,
    metadata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reference_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReferenceImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('poi_id')) {
      context.handle(
        _poiIdMeta,
        poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poiIdMeta);
    }
    if (data.containsKey('local_uri')) {
      context.handle(
        _localUriMeta,
        localUri.isAcceptableOrUnknown(data['local_uri']!, _localUriMeta),
      );
    } else if (isInserting) {
      context.missing(_localUriMeta);
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _remoteUrlMeta,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReferenceImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferenceImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poi_id'],
      )!,
      localUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_uri'],
      )!,
      remoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
    );
  }

  @override
  $ReferenceImagesTable createAlias(String alias) {
    return $ReferenceImagesTable(attachedDatabase, alias);
  }
}

class ReferenceImage extends DataClass implements Insertable<ReferenceImage> {
  final String id;
  final String poiId;
  final String localUri;
  final String? remoteUrl;
  final String? metadata;
  const ReferenceImage({
    required this.id,
    required this.poiId,
    required this.localUri,
    this.remoteUrl,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['poi_id'] = Variable<String>(poiId);
    map['local_uri'] = Variable<String>(localUri);
    if (!nullToAbsent || remoteUrl != null) {
      map['remote_url'] = Variable<String>(remoteUrl);
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    return map;
  }

  ReferenceImagesCompanion toCompanion(bool nullToAbsent) {
    return ReferenceImagesCompanion(
      id: Value(id),
      poiId: Value(poiId),
      localUri: Value(localUri),
      remoteUrl: remoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteUrl),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory ReferenceImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferenceImage(
      id: serializer.fromJson<String>(json['id']),
      poiId: serializer.fromJson<String>(json['poiId']),
      localUri: serializer.fromJson<String>(json['localUri']),
      remoteUrl: serializer.fromJson<String?>(json['remoteUrl']),
      metadata: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poiId': serializer.toJson<String>(poiId),
      'localUri': serializer.toJson<String>(localUri),
      'remoteUrl': serializer.toJson<String?>(remoteUrl),
      'metadata': serializer.toJson<String?>(metadata),
    };
  }

  ReferenceImage copyWith({
    String? id,
    String? poiId,
    String? localUri,
    Value<String?> remoteUrl = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
  }) => ReferenceImage(
    id: id ?? this.id,
    poiId: poiId ?? this.poiId,
    localUri: localUri ?? this.localUri,
    remoteUrl: remoteUrl.present ? remoteUrl.value : this.remoteUrl,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  ReferenceImage copyWithCompanion(ReferenceImagesCompanion data) {
    return ReferenceImage(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      localUri: data.localUri.present ? data.localUri.value : this.localUri,
      remoteUrl: data.remoteUrl.present ? data.remoteUrl.value : this.remoteUrl,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceImage(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('localUri: $localUri, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, poiId, localUri, remoteUrl, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferenceImage &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.localUri == this.localUri &&
          other.remoteUrl == this.remoteUrl &&
          other.metadata == this.metadata);
}

class ReferenceImagesCompanion extends UpdateCompanion<ReferenceImage> {
  final Value<String> id;
  final Value<String> poiId;
  final Value<String> localUri;
  final Value<String?> remoteUrl;
  final Value<String?> metadata;
  final Value<int> rowid;
  const ReferenceImagesCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.localUri = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReferenceImagesCompanion.insert({
    required String id,
    required String poiId,
    required String localUri,
    this.remoteUrl = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poiId = Value(poiId),
       localUri = Value(localUri);
  static Insertable<ReferenceImage> custom({
    Expression<String>? id,
    Expression<String>? poiId,
    Expression<String>? localUri,
    Expression<String>? remoteUrl,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (localUri != null) 'local_uri': localUri,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReferenceImagesCompanion copyWith({
    Value<String>? id,
    Value<String>? poiId,
    Value<String>? localUri,
    Value<String?>? remoteUrl,
    Value<String?>? metadata,
    Value<int>? rowid,
  }) {
    return ReferenceImagesCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      localUri: localUri ?? this.localUri,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poiId.present) {
      map['poi_id'] = Variable<String>(poiId.value);
    }
    if (localUri.present) {
      map['local_uri'] = Variable<String>(localUri.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceImagesCompanion(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('localUri: $localUri, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaAssetsTable extends MediaAssets
    with TableInfo<$MediaAssetsTable, MediaAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<String> poiId = GeneratedColumn<String>(
    'poi_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pois (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localUriMeta = const VerificationMeta(
    'localUri',
  );
  @override
  late final GeneratedColumn<String> localUri = GeneratedColumn<String>(
    'local_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteUrlMeta = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceImageIdMeta = const VerificationMeta(
    'referenceImageId',
  );
  @override
  late final GeneratedColumn<String> referenceImageId = GeneratedColumn<String>(
    'reference_image_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reference_images (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    poiId,
    type,
    localUri,
    remoteUrl,
    metadata,
    referenceImageId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('poi_id')) {
      context.handle(
        _poiIdMeta,
        poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_poiIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('local_uri')) {
      context.handle(
        _localUriMeta,
        localUri.isAcceptableOrUnknown(data['local_uri']!, _localUriMeta),
      );
    } else if (isInserting) {
      context.missing(_localUriMeta);
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _remoteUrlMeta,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    if (data.containsKey('reference_image_id')) {
      context.handle(
        _referenceImageIdMeta,
        referenceImageId.isAcceptableOrUnknown(
          data['reference_image_id']!,
          _referenceImageIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaAsset(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      poiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poi_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      localUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_uri'],
      )!,
      remoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      referenceImageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_image_id'],
      ),
    );
  }

  @override
  $MediaAssetsTable createAlias(String alias) {
    return $MediaAssetsTable(attachedDatabase, alias);
  }
}

class MediaAsset extends DataClass implements Insertable<MediaAsset> {
  final String id;
  final String poiId;
  final String type;
  final String localUri;
  final String? remoteUrl;
  final String? metadata;
  final String? referenceImageId;
  const MediaAsset({
    required this.id,
    required this.poiId,
    required this.type,
    required this.localUri,
    this.remoteUrl,
    this.metadata,
    this.referenceImageId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['poi_id'] = Variable<String>(poiId);
    map['type'] = Variable<String>(type);
    map['local_uri'] = Variable<String>(localUri);
    if (!nullToAbsent || remoteUrl != null) {
      map['remote_url'] = Variable<String>(remoteUrl);
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    if (!nullToAbsent || referenceImageId != null) {
      map['reference_image_id'] = Variable<String>(referenceImageId);
    }
    return map;
  }

  MediaAssetsCompanion toCompanion(bool nullToAbsent) {
    return MediaAssetsCompanion(
      id: Value(id),
      poiId: Value(poiId),
      type: Value(type),
      localUri: Value(localUri),
      remoteUrl: remoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteUrl),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
      referenceImageId: referenceImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceImageId),
    );
  }

  factory MediaAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaAsset(
      id: serializer.fromJson<String>(json['id']),
      poiId: serializer.fromJson<String>(json['poiId']),
      type: serializer.fromJson<String>(json['type']),
      localUri: serializer.fromJson<String>(json['localUri']),
      remoteUrl: serializer.fromJson<String?>(json['remoteUrl']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      referenceImageId: serializer.fromJson<String?>(json['referenceImageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'poiId': serializer.toJson<String>(poiId),
      'type': serializer.toJson<String>(type),
      'localUri': serializer.toJson<String>(localUri),
      'remoteUrl': serializer.toJson<String?>(remoteUrl),
      'metadata': serializer.toJson<String?>(metadata),
      'referenceImageId': serializer.toJson<String?>(referenceImageId),
    };
  }

  MediaAsset copyWith({
    String? id,
    String? poiId,
    String? type,
    String? localUri,
    Value<String?> remoteUrl = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
    Value<String?> referenceImageId = const Value.absent(),
  }) => MediaAsset(
    id: id ?? this.id,
    poiId: poiId ?? this.poiId,
    type: type ?? this.type,
    localUri: localUri ?? this.localUri,
    remoteUrl: remoteUrl.present ? remoteUrl.value : this.remoteUrl,
    metadata: metadata.present ? metadata.value : this.metadata,
    referenceImageId: referenceImageId.present
        ? referenceImageId.value
        : this.referenceImageId,
  );
  MediaAsset copyWithCompanion(MediaAssetsCompanion data) {
    return MediaAsset(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      type: data.type.present ? data.type.value : this.type,
      localUri: data.localUri.present ? data.localUri.value : this.localUri,
      remoteUrl: data.remoteUrl.present ? data.remoteUrl.value : this.remoteUrl,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      referenceImageId: data.referenceImageId.present
          ? data.referenceImageId.value
          : this.referenceImageId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaAsset(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('type: $type, ')
          ..write('localUri: $localUri, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('metadata: $metadata, ')
          ..write('referenceImageId: $referenceImageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    poiId,
    type,
    localUri,
    remoteUrl,
    metadata,
    referenceImageId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaAsset &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.type == this.type &&
          other.localUri == this.localUri &&
          other.remoteUrl == this.remoteUrl &&
          other.metadata == this.metadata &&
          other.referenceImageId == this.referenceImageId);
}

class MediaAssetsCompanion extends UpdateCompanion<MediaAsset> {
  final Value<String> id;
  final Value<String> poiId;
  final Value<String> type;
  final Value<String> localUri;
  final Value<String?> remoteUrl;
  final Value<String?> metadata;
  final Value<String?> referenceImageId;
  final Value<int> rowid;
  const MediaAssetsCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.type = const Value.absent(),
    this.localUri = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.metadata = const Value.absent(),
    this.referenceImageId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaAssetsCompanion.insert({
    required String id,
    required String poiId,
    required String type,
    required String localUri,
    this.remoteUrl = const Value.absent(),
    this.metadata = const Value.absent(),
    this.referenceImageId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       poiId = Value(poiId),
       type = Value(type),
       localUri = Value(localUri);
  static Insertable<MediaAsset> custom({
    Expression<String>? id,
    Expression<String>? poiId,
    Expression<String>? type,
    Expression<String>? localUri,
    Expression<String>? remoteUrl,
    Expression<String>? metadata,
    Expression<String>? referenceImageId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (type != null) 'type': type,
      if (localUri != null) 'local_uri': localUri,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (metadata != null) 'metadata': metadata,
      if (referenceImageId != null) 'reference_image_id': referenceImageId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaAssetsCompanion copyWith({
    Value<String>? id,
    Value<String>? poiId,
    Value<String>? type,
    Value<String>? localUri,
    Value<String?>? remoteUrl,
    Value<String?>? metadata,
    Value<String?>? referenceImageId,
    Value<int>? rowid,
  }) {
    return MediaAssetsCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      type: type ?? this.type,
      localUri: localUri ?? this.localUri,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      metadata: metadata ?? this.metadata,
      referenceImageId: referenceImageId ?? this.referenceImageId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (poiId.present) {
      map['poi_id'] = Variable<String>(poiId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (localUri.present) {
      map['local_uri'] = Variable<String>(localUri.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (referenceImageId.present) {
      map['reference_image_id'] = Variable<String>(referenceImageId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaAssetsCompanion(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('type: $type, ')
          ..write('localUri: $localUri, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('metadata: $metadata, ')
          ..write('referenceImageId: $referenceImageId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RoisTable rois = $RoisTable(this);
  late final $PoisTable pois = $PoisTable(this);
  late final $TimeChunksTable timeChunks = $TimeChunksTable(this);
  late final $ReferenceImagesTable referenceImages = $ReferenceImagesTable(
    this,
  );
  late final $MediaAssetsTable mediaAssets = $MediaAssetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    rois,
    pois,
    timeChunks,
    referenceImages,
    mediaAssets,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'reference_images',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('media_assets', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$RoisTableCreateCompanionBuilder =
    RoisCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<int> isOfflineCached,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$RoisTableUpdateCompanionBuilder =
    RoisCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<int> isOfflineCached,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$RoisTableReferences
    extends BaseReferences<_$AppDatabase, $RoisTable, Roi> {
  $$RoisTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PoisTable, List<Poi>> _poisRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pois,
    aliasName: $_aliasNameGenerator(db.rois.id, db.pois.roiId),
  );

  $$PoisTableProcessedTableManager get poisRefs {
    final manager = $$PoisTableTableManager(
      $_db,
      $_db.pois,
    ).filter((f) => f.roiId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_poisRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoisTableFilterComposer extends Composer<_$AppDatabase, $RoisTable> {
  $$RoisTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isOfflineCached => $composableBuilder(
    column: $table.isOfflineCached,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> poisRefs(
    Expression<bool> Function($$PoisTableFilterComposer f) f,
  ) {
    final $$PoisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.roiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableFilterComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoisTableOrderingComposer extends Composer<_$AppDatabase, $RoisTable> {
  $$RoisTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isOfflineCached => $composableBuilder(
    column: $table.isOfflineCached,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoisTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoisTable> {
  $$RoisTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isOfflineCached => $composableBuilder(
    column: $table.isOfflineCached,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> poisRefs<T extends Object>(
    Expression<T> Function($$PoisTableAnnotationComposer a) f,
  ) {
    final $$PoisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.roiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableAnnotationComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoisTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoisTable,
          Roi,
          $$RoisTableFilterComposer,
          $$RoisTableOrderingComposer,
          $$RoisTableAnnotationComposer,
          $$RoisTableCreateCompanionBuilder,
          $$RoisTableUpdateCompanionBuilder,
          (Roi, $$RoisTableReferences),
          Roi,
          PrefetchHooks Function({bool poisRefs})
        > {
  $$RoisTableTableManager(_$AppDatabase db, $RoisTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoisTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoisTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoisTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> isOfflineCached = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoisCompanion(
                id: id,
                name: name,
                description: description,
                isOfflineCached: isOfflineCached,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> isOfflineCached = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoisCompanion.insert(
                id: id,
                name: name,
                description: description,
                isOfflineCached: isOfflineCached,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RoisTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({poisRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (poisRefs) db.pois],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (poisRefs)
                    await $_getPrefetchedData<Roi, $RoisTable, Poi>(
                      currentTable: table,
                      referencedTable: $$RoisTableReferences._poisRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RoisTableReferences(db, table, p0).poisRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.roiId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoisTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoisTable,
      Roi,
      $$RoisTableFilterComposer,
      $$RoisTableOrderingComposer,
      $$RoisTableAnnotationComposer,
      $$RoisTableCreateCompanionBuilder,
      $$RoisTableUpdateCompanionBuilder,
      (Roi, $$RoisTableReferences),
      Roi,
      PrefetchHooks Function({bool poisRefs})
    >;
typedef $$PoisTableCreateCompanionBuilder =
    PoisCompanion Function({
      required String id,
      required String roiId,
      required String name,
      Value<String?> description,
      Value<String?> address,
      required double lat,
      required double lng,
      Value<String?> businessHours,
      Value<String?> contactInfo,
      Value<String?> coverImageUri,
      Value<String?> tags,
      Value<String?> animeSeriesRef,
      Value<int> rowid,
    });
typedef $$PoisTableUpdateCompanionBuilder =
    PoisCompanion Function({
      Value<String> id,
      Value<String> roiId,
      Value<String> name,
      Value<String?> description,
      Value<String?> address,
      Value<double> lat,
      Value<double> lng,
      Value<String?> businessHours,
      Value<String?> contactInfo,
      Value<String?> coverImageUri,
      Value<String?> tags,
      Value<String?> animeSeriesRef,
      Value<int> rowid,
    });

final class $$PoisTableReferences
    extends BaseReferences<_$AppDatabase, $PoisTable, Poi> {
  $$PoisTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoisTable _roiIdTable(_$AppDatabase db) =>
      db.rois.createAlias($_aliasNameGenerator(db.pois.roiId, db.rois.id));

  $$RoisTableProcessedTableManager get roiId {
    final $_column = $_itemColumn<String>('roi_id')!;

    final manager = $$RoisTableTableManager(
      $_db,
      $_db.rois,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roiIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TimeChunksTable, List<TimeChunk>>
  _timeChunksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timeChunks,
    aliasName: $_aliasNameGenerator(db.pois.id, db.timeChunks.poiId),
  );

  $$TimeChunksTableProcessedTableManager get timeChunksRefs {
    final manager = $$TimeChunksTableTableManager(
      $_db,
      $_db.timeChunks,
    ).filter((f) => f.poiId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_timeChunksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReferenceImagesTable, List<ReferenceImage>>
  _referenceImagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.referenceImages,
    aliasName: $_aliasNameGenerator(db.pois.id, db.referenceImages.poiId),
  );

  $$ReferenceImagesTableProcessedTableManager get referenceImagesRefs {
    final manager = $$ReferenceImagesTableTableManager(
      $_db,
      $_db.referenceImages,
    ).filter((f) => f.poiId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _referenceImagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MediaAssetsTable, List<MediaAsset>>
  _mediaAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaAssets,
    aliasName: $_aliasNameGenerator(db.pois.id, db.mediaAssets.poiId),
  );

  $$MediaAssetsTableProcessedTableManager get mediaAssetsRefs {
    final manager = $$MediaAssetsTableTableManager(
      $_db,
      $_db.mediaAssets,
    ).filter((f) => f.poiId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PoisTableFilterComposer extends Composer<_$AppDatabase, $PoisTable> {
  $$PoisTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessHours => $composableBuilder(
    column: $table.businessHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageUri => $composableBuilder(
    column: $table.coverImageUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animeSeriesRef => $composableBuilder(
    column: $table.animeSeriesRef,
    builder: (column) => ColumnFilters(column),
  );

  $$RoisTableFilterComposer get roiId {
    final $$RoisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roiId,
      referencedTable: $db.rois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoisTableFilterComposer(
            $db: $db,
            $table: $db.rois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> timeChunksRefs(
    Expression<bool> Function($$TimeChunksTableFilterComposer f) f,
  ) {
    final $$TimeChunksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeChunks,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeChunksTableFilterComposer(
            $db: $db,
            $table: $db.timeChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> referenceImagesRefs(
    Expression<bool> Function($$ReferenceImagesTableFilterComposer f) f,
  ) {
    final $$ReferenceImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.referenceImages,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceImagesTableFilterComposer(
            $db: $db,
            $table: $db.referenceImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mediaAssetsRefs(
    Expression<bool> Function($$MediaAssetsTableFilterComposer f) f,
  ) {
    final $$MediaAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAssets,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAssetsTableFilterComposer(
            $db: $db,
            $table: $db.mediaAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PoisTableOrderingComposer extends Composer<_$AppDatabase, $PoisTable> {
  $$PoisTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessHours => $composableBuilder(
    column: $table.businessHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageUri => $composableBuilder(
    column: $table.coverImageUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animeSeriesRef => $composableBuilder(
    column: $table.animeSeriesRef,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoisTableOrderingComposer get roiId {
    final $$RoisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roiId,
      referencedTable: $db.rois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoisTableOrderingComposer(
            $db: $db,
            $table: $db.rois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PoisTableAnnotationComposer
    extends Composer<_$AppDatabase, $PoisTable> {
  $$PoisTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get businessHours => $composableBuilder(
    column: $table.businessHours,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverImageUri => $composableBuilder(
    column: $table.coverImageUri,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get animeSeriesRef => $composableBuilder(
    column: $table.animeSeriesRef,
    builder: (column) => column,
  );

  $$RoisTableAnnotationComposer get roiId {
    final $$RoisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roiId,
      referencedTable: $db.rois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoisTableAnnotationComposer(
            $db: $db,
            $table: $db.rois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> timeChunksRefs<T extends Object>(
    Expression<T> Function($$TimeChunksTableAnnotationComposer a) f,
  ) {
    final $$TimeChunksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeChunks,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeChunksTableAnnotationComposer(
            $db: $db,
            $table: $db.timeChunks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> referenceImagesRefs<T extends Object>(
    Expression<T> Function($$ReferenceImagesTableAnnotationComposer a) f,
  ) {
    final $$ReferenceImagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.referenceImages,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceImagesTableAnnotationComposer(
            $db: $db,
            $table: $db.referenceImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mediaAssetsRefs<T extends Object>(
    Expression<T> Function($$MediaAssetsTableAnnotationComposer a) f,
  ) {
    final $$MediaAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAssets,
      getReferencedColumn: (t) => t.poiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PoisTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PoisTable,
          Poi,
          $$PoisTableFilterComposer,
          $$PoisTableOrderingComposer,
          $$PoisTableAnnotationComposer,
          $$PoisTableCreateCompanionBuilder,
          $$PoisTableUpdateCompanionBuilder,
          (Poi, $$PoisTableReferences),
          Poi,
          PrefetchHooks Function({
            bool roiId,
            bool timeChunksRefs,
            bool referenceImagesRefs,
            bool mediaAssetsRefs,
          })
        > {
  $$PoisTableTableManager(_$AppDatabase db, $PoisTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PoisTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PoisTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PoisTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roiId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<String?> businessHours = const Value.absent(),
                Value<String?> contactInfo = const Value.absent(),
                Value<String?> coverImageUri = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> animeSeriesRef = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PoisCompanion(
                id: id,
                roiId: roiId,
                name: name,
                description: description,
                address: address,
                lat: lat,
                lng: lng,
                businessHours: businessHours,
                contactInfo: contactInfo,
                coverImageUri: coverImageUri,
                tags: tags,
                animeSeriesRef: animeSeriesRef,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roiId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> address = const Value.absent(),
                required double lat,
                required double lng,
                Value<String?> businessHours = const Value.absent(),
                Value<String?> contactInfo = const Value.absent(),
                Value<String?> coverImageUri = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> animeSeriesRef = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PoisCompanion.insert(
                id: id,
                roiId: roiId,
                name: name,
                description: description,
                address: address,
                lat: lat,
                lng: lng,
                businessHours: businessHours,
                contactInfo: contactInfo,
                coverImageUri: coverImageUri,
                tags: tags,
                animeSeriesRef: animeSeriesRef,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PoisTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roiId = false,
                timeChunksRefs = false,
                referenceImagesRefs = false,
                mediaAssetsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timeChunksRefs) db.timeChunks,
                    if (referenceImagesRefs) db.referenceImages,
                    if (mediaAssetsRefs) db.mediaAssets,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roiId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roiId,
                                    referencedTable: $$PoisTableReferences
                                        ._roiIdTable(db),
                                    referencedColumn: $$PoisTableReferences
                                        ._roiIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timeChunksRefs)
                        await $_getPrefetchedData<Poi, $PoisTable, TimeChunk>(
                          currentTable: table,
                          referencedTable: $$PoisTableReferences
                              ._timeChunksRefsTable(db),
                          managerFromTypedResult: (p0) => $$PoisTableReferences(
                            db,
                            table,
                            p0,
                          ).timeChunksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poiId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (referenceImagesRefs)
                        await $_getPrefetchedData<
                          Poi,
                          $PoisTable,
                          ReferenceImage
                        >(
                          currentTable: table,
                          referencedTable: $$PoisTableReferences
                              ._referenceImagesRefsTable(db),
                          managerFromTypedResult: (p0) => $$PoisTableReferences(
                            db,
                            table,
                            p0,
                          ).referenceImagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poiId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mediaAssetsRefs)
                        await $_getPrefetchedData<Poi, $PoisTable, MediaAsset>(
                          currentTable: table,
                          referencedTable: $$PoisTableReferences
                              ._mediaAssetsRefsTable(db),
                          managerFromTypedResult: (p0) => $$PoisTableReferences(
                            db,
                            table,
                            p0,
                          ).mediaAssetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.poiId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PoisTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PoisTable,
      Poi,
      $$PoisTableFilterComposer,
      $$PoisTableOrderingComposer,
      $$PoisTableAnnotationComposer,
      $$PoisTableCreateCompanionBuilder,
      $$PoisTableUpdateCompanionBuilder,
      (Poi, $$PoisTableReferences),
      Poi,
      PrefetchHooks Function({
        bool roiId,
        bool timeChunksRefs,
        bool referenceImagesRefs,
        bool mediaAssetsRefs,
      })
    >;
typedef $$TimeChunksTableCreateCompanionBuilder =
    TimeChunksCompanion Function({
      required String id,
      required String poiId,
      Value<String?> date,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$TimeChunksTableUpdateCompanionBuilder =
    TimeChunksCompanion Function({
      Value<String> id,
      Value<String> poiId,
      Value<String?> date,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<String> status,
      Value<int> rowid,
    });

final class $$TimeChunksTableReferences
    extends BaseReferences<_$AppDatabase, $TimeChunksTable, TimeChunk> {
  $$TimeChunksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PoisTable _poiIdTable(_$AppDatabase db) => db.pois.createAlias(
    $_aliasNameGenerator(db.timeChunks.poiId, db.pois.id),
  );

  $$PoisTableProcessedTableManager get poiId {
    final $_column = $_itemColumn<String>('poi_id')!;

    final manager = $$PoisTableTableManager(
      $_db,
      $_db.pois,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poiIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TimeChunksTableFilterComposer
    extends Composer<_$AppDatabase, $TimeChunksTable> {
  $$TimeChunksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PoisTableFilterComposer get poiId {
    final $$PoisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableFilterComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeChunksTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeChunksTable> {
  $$TimeChunksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PoisTableOrderingComposer get poiId {
    final $$PoisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableOrderingComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeChunksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeChunksTable> {
  $$TimeChunksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PoisTableAnnotationComposer get poiId {
    final $$PoisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableAnnotationComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeChunksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimeChunksTable,
          TimeChunk,
          $$TimeChunksTableFilterComposer,
          $$TimeChunksTableOrderingComposer,
          $$TimeChunksTableAnnotationComposer,
          $$TimeChunksTableCreateCompanionBuilder,
          $$TimeChunksTableUpdateCompanionBuilder,
          (TimeChunk, $$TimeChunksTableReferences),
          TimeChunk,
          PrefetchHooks Function({bool poiId})
        > {
  $$TimeChunksTableTableManager(_$AppDatabase db, $TimeChunksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeChunksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeChunksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeChunksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poiId = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimeChunksCompanion(
                id: id,
                poiId: poiId,
                date: date,
                startTime: startTime,
                endTime: endTime,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poiId,
                Value<String?> date = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimeChunksCompanion.insert(
                id: id,
                poiId: poiId,
                date: date,
                startTime: startTime,
                endTime: endTime,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimeChunksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({poiId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (poiId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poiId,
                                referencedTable: $$TimeChunksTableReferences
                                    ._poiIdTable(db),
                                referencedColumn: $$TimeChunksTableReferences
                                    ._poiIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TimeChunksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimeChunksTable,
      TimeChunk,
      $$TimeChunksTableFilterComposer,
      $$TimeChunksTableOrderingComposer,
      $$TimeChunksTableAnnotationComposer,
      $$TimeChunksTableCreateCompanionBuilder,
      $$TimeChunksTableUpdateCompanionBuilder,
      (TimeChunk, $$TimeChunksTableReferences),
      TimeChunk,
      PrefetchHooks Function({bool poiId})
    >;
typedef $$ReferenceImagesTableCreateCompanionBuilder =
    ReferenceImagesCompanion Function({
      required String id,
      required String poiId,
      required String localUri,
      Value<String?> remoteUrl,
      Value<String?> metadata,
      Value<int> rowid,
    });
typedef $$ReferenceImagesTableUpdateCompanionBuilder =
    ReferenceImagesCompanion Function({
      Value<String> id,
      Value<String> poiId,
      Value<String> localUri,
      Value<String?> remoteUrl,
      Value<String?> metadata,
      Value<int> rowid,
    });

final class $$ReferenceImagesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ReferenceImagesTable, ReferenceImage> {
  $$ReferenceImagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PoisTable _poiIdTable(_$AppDatabase db) => db.pois.createAlias(
    $_aliasNameGenerator(db.referenceImages.poiId, db.pois.id),
  );

  $$PoisTableProcessedTableManager get poiId {
    final $_column = $_itemColumn<String>('poi_id')!;

    final manager = $$PoisTableTableManager(
      $_db,
      $_db.pois,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poiIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MediaAssetsTable, List<MediaAsset>>
  _mediaAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaAssets,
    aliasName: $_aliasNameGenerator(
      db.referenceImages.id,
      db.mediaAssets.referenceImageId,
    ),
  );

  $$MediaAssetsTableProcessedTableManager get mediaAssetsRefs {
    final manager = $$MediaAssetsTableTableManager($_db, $_db.mediaAssets)
        .filter(
          (f) => f.referenceImageId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_mediaAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReferenceImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ReferenceImagesTable> {
  $$ReferenceImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localUri => $composableBuilder(
    column: $table.localUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  $$PoisTableFilterComposer get poiId {
    final $$PoisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableFilterComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mediaAssetsRefs(
    Expression<bool> Function($$MediaAssetsTableFilterComposer f) f,
  ) {
    final $$MediaAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAssets,
      getReferencedColumn: (t) => t.referenceImageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAssetsTableFilterComposer(
            $db: $db,
            $table: $db.mediaAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReferenceImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferenceImagesTable> {
  $$ReferenceImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localUri => $composableBuilder(
    column: $table.localUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  $$PoisTableOrderingComposer get poiId {
    final $$PoisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableOrderingComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReferenceImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferenceImagesTable> {
  $$ReferenceImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localUri =>
      $composableBuilder(column: $table.localUri, builder: (column) => column);

  GeneratedColumn<String> get remoteUrl =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  $$PoisTableAnnotationComposer get poiId {
    final $$PoisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableAnnotationComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mediaAssetsRefs<T extends Object>(
    Expression<T> Function($$MediaAssetsTableAnnotationComposer a) f,
  ) {
    final $$MediaAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAssets,
      getReferencedColumn: (t) => t.referenceImageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReferenceImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReferenceImagesTable,
          ReferenceImage,
          $$ReferenceImagesTableFilterComposer,
          $$ReferenceImagesTableOrderingComposer,
          $$ReferenceImagesTableAnnotationComposer,
          $$ReferenceImagesTableCreateCompanionBuilder,
          $$ReferenceImagesTableUpdateCompanionBuilder,
          (ReferenceImage, $$ReferenceImagesTableReferences),
          ReferenceImage,
          PrefetchHooks Function({bool poiId, bool mediaAssetsRefs})
        > {
  $$ReferenceImagesTableTableManager(
    _$AppDatabase db,
    $ReferenceImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferenceImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferenceImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferenceImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poiId = const Value.absent(),
                Value<String> localUri = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReferenceImagesCompanion(
                id: id,
                poiId: poiId,
                localUri: localUri,
                remoteUrl: remoteUrl,
                metadata: metadata,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poiId,
                required String localUri,
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReferenceImagesCompanion.insert(
                id: id,
                poiId: poiId,
                localUri: localUri,
                remoteUrl: remoteUrl,
                metadata: metadata,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReferenceImagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({poiId = false, mediaAssetsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mediaAssetsRefs) db.mediaAssets],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (poiId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poiId,
                                referencedTable:
                                    $$ReferenceImagesTableReferences
                                        ._poiIdTable(db),
                                referencedColumn:
                                    $$ReferenceImagesTableReferences
                                        ._poiIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediaAssetsRefs)
                    await $_getPrefetchedData<
                      ReferenceImage,
                      $ReferenceImagesTable,
                      MediaAsset
                    >(
                      currentTable: table,
                      referencedTable: $$ReferenceImagesTableReferences
                          ._mediaAssetsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ReferenceImagesTableReferences(
                            db,
                            table,
                            p0,
                          ).mediaAssetsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.referenceImageId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ReferenceImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReferenceImagesTable,
      ReferenceImage,
      $$ReferenceImagesTableFilterComposer,
      $$ReferenceImagesTableOrderingComposer,
      $$ReferenceImagesTableAnnotationComposer,
      $$ReferenceImagesTableCreateCompanionBuilder,
      $$ReferenceImagesTableUpdateCompanionBuilder,
      (ReferenceImage, $$ReferenceImagesTableReferences),
      ReferenceImage,
      PrefetchHooks Function({bool poiId, bool mediaAssetsRefs})
    >;
typedef $$MediaAssetsTableCreateCompanionBuilder =
    MediaAssetsCompanion Function({
      required String id,
      required String poiId,
      required String type,
      required String localUri,
      Value<String?> remoteUrl,
      Value<String?> metadata,
      Value<String?> referenceImageId,
      Value<int> rowid,
    });
typedef $$MediaAssetsTableUpdateCompanionBuilder =
    MediaAssetsCompanion Function({
      Value<String> id,
      Value<String> poiId,
      Value<String> type,
      Value<String> localUri,
      Value<String?> remoteUrl,
      Value<String?> metadata,
      Value<String?> referenceImageId,
      Value<int> rowid,
    });

final class $$MediaAssetsTableReferences
    extends BaseReferences<_$AppDatabase, $MediaAssetsTable, MediaAsset> {
  $$MediaAssetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PoisTable _poiIdTable(_$AppDatabase db) => db.pois.createAlias(
    $_aliasNameGenerator(db.mediaAssets.poiId, db.pois.id),
  );

  $$PoisTableProcessedTableManager get poiId {
    final $_column = $_itemColumn<String>('poi_id')!;

    final manager = $$PoisTableTableManager(
      $_db,
      $_db.pois,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_poiIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ReferenceImagesTable _referenceImageIdTable(_$AppDatabase db) =>
      db.referenceImages.createAlias(
        $_aliasNameGenerator(
          db.mediaAssets.referenceImageId,
          db.referenceImages.id,
        ),
      );

  $$ReferenceImagesTableProcessedTableManager? get referenceImageId {
    final $_column = $_itemColumn<String>('reference_image_id');
    if ($_column == null) return null;
    final manager = $$ReferenceImagesTableTableManager(
      $_db,
      $_db.referenceImages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_referenceImageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MediaAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $MediaAssetsTable> {
  $$MediaAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localUri => $composableBuilder(
    column: $table.localUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  $$PoisTableFilterComposer get poiId {
    final $$PoisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableFilterComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReferenceImagesTableFilterComposer get referenceImageId {
    final $$ReferenceImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.referenceImageId,
      referencedTable: $db.referenceImages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceImagesTableFilterComposer(
            $db: $db,
            $table: $db.referenceImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaAssetsTable> {
  $$MediaAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localUri => $composableBuilder(
    column: $table.localUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  $$PoisTableOrderingComposer get poiId {
    final $$PoisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableOrderingComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReferenceImagesTableOrderingComposer get referenceImageId {
    final $$ReferenceImagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.referenceImageId,
      referencedTable: $db.referenceImages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceImagesTableOrderingComposer(
            $db: $db,
            $table: $db.referenceImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaAssetsTable> {
  $$MediaAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get localUri =>
      $composableBuilder(column: $table.localUri, builder: (column) => column);

  GeneratedColumn<String> get remoteUrl =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  $$PoisTableAnnotationComposer get poiId {
    final $$PoisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.poiId,
      referencedTable: $db.pois,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PoisTableAnnotationComposer(
            $db: $db,
            $table: $db.pois,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ReferenceImagesTableAnnotationComposer get referenceImageId {
    final $$ReferenceImagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.referenceImageId,
      referencedTable: $db.referenceImages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferenceImagesTableAnnotationComposer(
            $db: $db,
            $table: $db.referenceImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaAssetsTable,
          MediaAsset,
          $$MediaAssetsTableFilterComposer,
          $$MediaAssetsTableOrderingComposer,
          $$MediaAssetsTableAnnotationComposer,
          $$MediaAssetsTableCreateCompanionBuilder,
          $$MediaAssetsTableUpdateCompanionBuilder,
          (MediaAsset, $$MediaAssetsTableReferences),
          MediaAsset,
          PrefetchHooks Function({bool poiId, bool referenceImageId})
        > {
  $$MediaAssetsTableTableManager(_$AppDatabase db, $MediaAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> poiId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> localUri = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> referenceImageId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaAssetsCompanion(
                id: id,
                poiId: poiId,
                type: type,
                localUri: localUri,
                remoteUrl: remoteUrl,
                metadata: metadata,
                referenceImageId: referenceImageId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String poiId,
                required String type,
                required String localUri,
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> referenceImageId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaAssetsCompanion.insert(
                id: id,
                poiId: poiId,
                type: type,
                localUri: localUri,
                remoteUrl: remoteUrl,
                metadata: metadata,
                referenceImageId: referenceImageId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MediaAssetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({poiId = false, referenceImageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (poiId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.poiId,
                                referencedTable: $$MediaAssetsTableReferences
                                    ._poiIdTable(db),
                                referencedColumn: $$MediaAssetsTableReferences
                                    ._poiIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (referenceImageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.referenceImageId,
                                referencedTable: $$MediaAssetsTableReferences
                                    ._referenceImageIdTable(db),
                                referencedColumn: $$MediaAssetsTableReferences
                                    ._referenceImageIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MediaAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaAssetsTable,
      MediaAsset,
      $$MediaAssetsTableFilterComposer,
      $$MediaAssetsTableOrderingComposer,
      $$MediaAssetsTableAnnotationComposer,
      $$MediaAssetsTableCreateCompanionBuilder,
      $$MediaAssetsTableUpdateCompanionBuilder,
      (MediaAsset, $$MediaAssetsTableReferences),
      MediaAsset,
      PrefetchHooks Function({bool poiId, bool referenceImageId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RoisTableTableManager get rois => $$RoisTableTableManager(_db, _db.rois);
  $$PoisTableTableManager get pois => $$PoisTableTableManager(_db, _db.pois);
  $$TimeChunksTableTableManager get timeChunks =>
      $$TimeChunksTableTableManager(_db, _db.timeChunks);
  $$ReferenceImagesTableTableManager get referenceImages =>
      $$ReferenceImagesTableTableManager(_db, _db.referenceImages);
  $$MediaAssetsTableTableManager get mediaAssets =>
      $$MediaAssetsTableTableManager(_db, _db.mediaAssets);
}
