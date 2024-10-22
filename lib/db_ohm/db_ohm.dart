import 'package:get/get.dart';
import 'package:ohm/db_ohm/ohm_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBOhm extends GetxService {
  late Database dbBase;

  Future<DBOhm> init() async {
    await createOHMDB();
    return this;
  }

  createOHMDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'ohm.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createOHMTable(db);
        });
  }

  createOHMTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS ohm (id INTEGER PRIMARY KEY, createTime TEXT, type INTEGER, text1 TEXT, text2 TEXT, result TEXT)');
  }

  cleanAllData() async {
    await dbBase.delete('ohm');
  }

  Future<List<OHMEntity>> getAllData() async {
    var result = await dbBase.query('ohm', orderBy: 'createTime DESC');
    return result.map((e) => OHMEntity.fromJson(e)).toList();
  }
}
