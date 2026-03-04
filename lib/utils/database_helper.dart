import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'student.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profilePic(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveProfilePic(String url) async {
    final db = await database;

    await db.insert('profilePic', {
      'id': 1,
      'url': url,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<String?> getProfilePic() async {
    final db = await database;
    final result = await db.query('profilePic');

    if (result.isNotEmpty) {
      return result.first['url'] as String;
    }
    return null;
  }
}
