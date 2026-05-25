import 'package:drift/drift.dart';

class Rois extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  IntColumn get isOfflineCached => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Pois extends Table {
  TextColumn get id => text()();
  TextColumn get roiId => text().references(Rois, #id)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get address => text().nullable()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get businessHours => text().nullable()();
  TextColumn get contactInfo => text().nullable()();
  TextColumn get coverImageUri => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get animeSeriesRef => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class TimeChunks extends Table {
  TextColumn get id => text()();
  TextColumn get poiId => text().references(Pois, #id)();
  TextColumn get date => text().nullable()();
  TextColumn get startTime => text().nullable()();
  TextColumn get endTime => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('backlog'))();

  @override
  Set<Column> get primaryKey => {id};
}

class ReferenceImages extends Table {
  TextColumn get id => text()();
  TextColumn get poiId => text().references(Pois, #id)();
  TextColumn get localUri => text()();
  TextColumn get remoteUrl => text().nullable()();
  TextColumn get metadata => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class MediaAssets extends Table {
  TextColumn get id => text()();
  TextColumn get poiId => text().references(Pois, #id)();
  TextColumn get type => text()();
  TextColumn get localUri => text()();
  TextColumn get remoteUrl => text().nullable()();
  TextColumn get metadata => text().nullable()();
  TextColumn get referenceImageId => text()
      .nullable()
      .references(ReferenceImages, #id, onDelete: KeyAction.setNull)();

  @override
  Set<Column> get primaryKey => {id};
}

