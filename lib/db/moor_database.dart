import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Histories extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get temperature => integer()();

  TextColumn get location => text().withLength(min: 1, max: 58)();

  TextColumn get date => text().withLength(min: 1, max: 58)();

  BoolColumn get isWarm => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id, temperature, location, date, isWarm};
}

@UseMoor(tables: [Histories])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite.database',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  Future<List<Historie>> getAllHistories() => select(histories).get();

  Stream<List<Historie>> watchAllHistories() => select(histories).watch();

  Future insertHistory(Historie task) => into(histories).insert(task);

  Future updateHistory(Historie task) => update(histories).replace(task);

  Future deleteHistory(Historie task) => delete(histories).delete(task);
}
