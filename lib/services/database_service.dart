import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'sessions.db');
    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE sessions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
          )
        ''');
        await db.execute('''
          CREATE TABLE rounds (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sessionId INTEGER,
            score INTEGER,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (sessionId) REFERENCES sessions (id)
          )
        ''');
      }
    );
  }

  Future<int> createSession(String name) async {
    final db = await database;
    return await db.insert('sessions', {'name': name});
  }

  Future<List<Map<String, dynamic>>> getSessions() async {
    final db = await database;
    return await db.query('sessions');
  }

  Future<int> updateSession(int id, String name) async {
    final db = await database;
    return await db.update('sessions', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteSession(int id) async {
    final db = await database;
    return await db.delete('sessions', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> createRound(int sessionId, int score) async {
    final db = await database;
    return await db.insert('rounds', {'sessionId': sessionId, 'score': score});
  }

  Future<List<Map<String, dynamic>>> getRoundsForSession(int sessionId) async {
    final db = await database;
    return await db.query('rounds', where: 'sessionId = ?', whereArgs: [sessionId]);
  }

  Future<int> updateRound(int id, int score) async {
    final db = await database;
    return await db.update('rounds', {'score': score}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteRound(int id) async {
    final db = await database;
    return await db.delete('rounds', where: 'id = ?', whereArgs: [id]);
  }
}