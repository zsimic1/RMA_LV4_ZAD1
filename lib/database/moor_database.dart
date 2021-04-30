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
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));
  @override
  int get schemaVersion => 1;


  Future createBirdStatus(Bird bird) => into(birds).insert(bird);
  Future updateBirdStatus(Bird bird) => update(birds).replace(bird);
  Stream<List<Bird>> watchAllBirdStatuses() => select(birds).watch();

}