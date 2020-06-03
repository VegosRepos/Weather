// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Historie extends DataClass implements Insertable<Historie> {
  final int id;
  final int temperature;
  final String location;
  final String date;
  final bool isWarm;
  Historie(
      {@required this.id,
      @required this.temperature,
      @required this.location,
      @required this.date,
      @required this.isWarm});
  factory Historie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Historie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      temperature: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      isWarm:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_warm']),
    );
  }
  factory Historie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Historie(
      id: serializer.fromJson<int>(json['id']),
      temperature: serializer.fromJson<int>(json['temperature']),
      location: serializer.fromJson<String>(json['location']),
      date: serializer.fromJson<String>(json['date']),
      isWarm: serializer.fromJson<bool>(json['isWarm']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'temperature': serializer.toJson<int>(temperature),
      'location': serializer.toJson<String>(location),
      'date': serializer.toJson<String>(date),
      'isWarm': serializer.toJson<bool>(isWarm),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Historie>>(bool nullToAbsent) {
    return HistoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      isWarm:
          isWarm == null && nullToAbsent ? const Value.absent() : Value(isWarm),
    ) as T;
  }

  Historie copyWith(
          {int id,
          int temperature,
          String location,
          String date,
          bool isWarm}) =>
      Historie(
        id: id ?? this.id,
        temperature: temperature ?? this.temperature,
        location: location ?? this.location,
        date: date ?? this.date,
        isWarm: isWarm ?? this.isWarm,
      );
  @override
  String toString() {
    return (StringBuffer('Historie(')
          ..write('id: $id, ')
          ..write('temperature: $temperature, ')
          ..write('location: $location, ')
          ..write('date: $date, ')
          ..write('isWarm: $isWarm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(temperature.hashCode,
          $mrjc(location.hashCode, $mrjc(date.hashCode, isWarm.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Historie &&
          other.id == id &&
          other.temperature == temperature &&
          other.location == location &&
          other.date == date &&
          other.isWarm == isWarm);
}

class HistoriesCompanion extends UpdateCompanion<Historie> {
  final Value<int> id;
  final Value<int> temperature;
  final Value<String> location;
  final Value<String> date;
  final Value<bool> isWarm;
  const HistoriesCompanion({
    this.id = const Value.absent(),
    this.temperature = const Value.absent(),
    this.location = const Value.absent(),
    this.date = const Value.absent(),
    this.isWarm = const Value.absent(),
  });
  HistoriesCompanion copyWith(
      {Value<int> id,
      Value<int> temperature,
      Value<String> location,
      Value<String> date,
      Value<bool> isWarm}) {
    return HistoriesCompanion(
      id: id ?? this.id,
      temperature: temperature ?? this.temperature,
      location: location ?? this.location,
      date: date ?? this.date,
      isWarm: isWarm ?? this.isWarm,
    );
  }
}

class $HistoriesTable extends Histories
    with TableInfo<$HistoriesTable, Historie> {
  final GeneratedDatabase _db;
  final String _alias;
  $HistoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  GeneratedIntColumn _temperature;
  @override
  GeneratedIntColumn get temperature =>
      _temperature ??= _constructTemperature();
  GeneratedIntColumn _constructTemperature() {
    return GeneratedIntColumn(
      'temperature',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn('location', $tableName, false,
        minTextLength: 1, maxTextLength: 58);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 1, maxTextLength: 58);
  }

  final VerificationMeta _isWarmMeta = const VerificationMeta('isWarm');
  GeneratedBoolColumn _isWarm;
  @override
  GeneratedBoolColumn get isWarm => _isWarm ??= _constructIsWarm();
  GeneratedBoolColumn _constructIsWarm() {
    return GeneratedBoolColumn('is_warm', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, temperature, location, date, isWarm];
  @override
  $HistoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'histories';
  @override
  final String actualTableName = 'histories';
  @override
  VerificationContext validateIntegrity(HistoriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.temperature.present) {
      context.handle(_temperatureMeta,
          temperature.isAcceptableValue(d.temperature.value, _temperatureMeta));
    } else if (temperature.isRequired && isInserting) {
      context.missing(_temperatureMeta);
    }
    if (d.location.present) {
      context.handle(_locationMeta,
          location.isAcceptableValue(d.location.value, _locationMeta));
    } else if (location.isRequired && isInserting) {
      context.missing(_locationMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.isWarm.present) {
      context.handle(
          _isWarmMeta, isWarm.isAcceptableValue(d.isWarm.value, _isWarmMeta));
    } else if (isWarm.isRequired && isInserting) {
      context.missing(_isWarmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {id, temperature, location, date, isWarm};
  @override
  Historie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Historie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(HistoriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.temperature.present) {
      map['temperature'] = Variable<int, IntType>(d.temperature.value);
    }
    if (d.location.present) {
      map['location'] = Variable<String, StringType>(d.location.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    if (d.isWarm.present) {
      map['is_warm'] = Variable<bool, BoolType>(d.isWarm.value);
    }
    return map;
  }

  @override
  $HistoriesTable createAlias(String alias) {
    return $HistoriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $HistoriesTable _histories;
  $HistoriesTable get histories => _histories ??= $HistoriesTable(this);
  @override
  List<TableInfo> get allTables => [histories];
}
