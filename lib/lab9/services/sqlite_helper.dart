import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'notes_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            content TEXT NOT NULL,
            created_at TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // CREATE
  Future<int> insertNote(String content) async {
    final db = await database;
    return await db.insert('notes', {
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // READ
  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query('notes', orderBy: 'id DESC');
  }

  // UPDATE
  Future<int> updateNote(int id, String newContent) async {
    final db = await database;
    return await db.update(
      'notes',
      {'content': newContent},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
