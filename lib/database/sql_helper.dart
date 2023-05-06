import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE appointment(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        tanggal date,
        dokter TEXT,
        waktu TEXT,
        user TEXT
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'demen-care.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('appointment', orderBy: "id");
  }

  Future<int> insertApp(
      DateTime tanggal, String? dokter, String? waktu, String? user) async {
    final db = await SQLHelper.db();

    final data = {
      'tanggal': tanggal,
      'dokter': dokter,
      'waktu': waktu,
      'user': user
    };
    final id = await db.insert('appointment', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  Future<void> delete(int id, final database) async {
    // Get a reference to the database.
    final db = await database;
    await db.delete(
      'appointment',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(int? id, DateTime tanggal, String? dokter, String? waktu,
      String? user) async {
    final db = await SQLHelper.db();

    final data = {
      'tanggal': tanggal,
      'dokter': dokter,
      'waktu': waktu,
      'user': user
    };

    final result =
        await db.update('appointment', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
