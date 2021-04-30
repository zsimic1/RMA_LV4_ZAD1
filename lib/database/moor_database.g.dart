// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Bird extends DataClass implements Insertable<Bird> {
  final int id;
  final String color;
  final int counter;
  Bird({@required this.id, @required this.color, @required this.counter});
  factory Bird.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Bird(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      color:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      counter:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}counter']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || counter != null) {
      map['counter'] = Variable<int>(counter);
    }
    return map;
  }

  BirdsCompanion toCompanion(bool nullToAbsent) {
    return BirdsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      counter: counter == null && nullToAbsent
          ? const Value.absent()
          : Value(counter),
    );
  }

  factory Bird.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Bird(
      id: serializer.fromJson<int>(json['id']),
      color: serializer.fromJson<String>(json['color']),
      counter: serializer.fromJson<int>(json['counter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'color': serializer.toJson<String>(color),
      'counter': serializer.toJson<int>(counter),
    };
  }

  Bird copyWith({int id, String color, int counter}) => Bird(
        id: id ?? this.id,
        color: color ?? this.color,
        counter: counter ?? this.counter,
      );
  @override
  String toString() {
    return (StringBuffer('Bird(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('counter: $counter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(color.hashCode, counter.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Bird &&
          other.id == this.id &&
          other.color == this.color &&
          other.counter == this.counter);
}

class BirdsCompanion extends UpdateCompanion<Bird> {
  final Value<int> id;
  final Value<String> color;
  final Value<int> counter;
  const BirdsCompanion({
    this.id = const Value.absent(),
    this.color = const Value.absent(),
    this.counter = const Value.absent(),
  });
  BirdsCompanion.insert({
    this.id = const Value.absent(),
    @required String color,
    @required int counter,
  })  : color = Value(color),
        counter = Value(counter);
  static Insertable<Bird> custom({
    Expression<int> id,
    Expression<String> color,
    Expression<int> counter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (color != null) 'color': color,
      if (counter != null) 'counter': counter,
    });
  }

  BirdsCompanion copyWith(
      {Value<int> id, Value<String> color, Value<int> counter}) {
    return BirdsCompanion(
      id: id ?? this.id,
      color: color ?? this.color,
      counter: counter ?? this.counter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (counter.present) {
      map['counter'] = Variable<int>(counter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BirdsCompanion(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('counter: $counter')
          ..write(')'))
        .toString();
  }
}

class $BirdsTable extends Birds with TableInfo<$BirdsTable, Bird> {
  final GeneratedDatabase _db;
  final String _alias;
  $BirdsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedTextColumn _color;
  @override
  GeneratedTextColumn get color => _color ??= _constructColor();
  GeneratedTextColumn _constructColor() {
    return GeneratedTextColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _counterMeta = const VerificationMeta('counter');
  GeneratedIntColumn _counter;
  @override
  GeneratedIntColumn get counter => _counter ??= _constructCounter();
  GeneratedIntColumn _constructCounter() {
    return GeneratedIntColumn(
      'counter',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, color, counter];
  @override
  $BirdsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'birds';
  @override
  final String actualTableName = 'birds';
  @override
  VerificationContext validateIntegrity(Insertable<Bird> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('counter')) {
      context.handle(_counterMeta,
          counter.isAcceptableOrUnknown(data['counter'], _counterMeta));
    } else if (isInserting) {
      context.missing(_counterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bird map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Bird.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BirdsTable createAlias(String alias) {
    return $BirdsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BirdsTable _birds;
  $BirdsTable get birds => _birds ??= $BirdsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [birds];
}
