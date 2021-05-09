import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

@DataClassName('Bird')
class Birds extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get color => text()();
  IntColumn get counter => integer()();
}

@UseMoor(tables: [Birds])
class AppDatabase extends _$AppDatabase {
  AppDatabase._()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
  @override
  int get schemaVersion => 1;

  static final AppDatabase _instance = AppDatabase._();
  factory AppDatabase() {
    return _instance;
  }

  Future createBirdStatus(Bird bird) => into(birds).insert(bird);

  Future<Bird> getBird() =>
      (select(birds)..where((bird) => bird.id.equals(0))).getSingle();
  Future resetBirdStatus() {
    var _i = 0;
    var color = "white";
    return update(birds).replace(Bird(id: 0, color: color, counter: _i));
  }

  Future updateBirdStatus(String color) async {
    var _birdInDb = await getBird();
    var _i = _birdInDb.counter;
    _i++;
    var _tempBird = _birdInDb.copyWith(color: color, counter: _i);
    return update(birds).replace(_tempBird);
  }

  Stream<List<Bird>> watchAllBirdStatuses() => select(birds).watch();
}
