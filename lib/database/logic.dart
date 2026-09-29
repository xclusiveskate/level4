import 'package:level4/database/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //create variable version
  static const int _version = 1;

  //create a database name
  static const String _dbname = "note.db";

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      version: _version,
      onCreate: (Database db, int version) {
        return db.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, date INTEGER)",
        );
      },
    );
  }

  static Future<void> insertNote(Notes note) async {
    final db = await _getDB();
    await db.insert(
      "Notes",
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Notes>> readNotes() async {
    final db = await _getDB();
    List<Map<String, dynamic>> notes = await db.query("Notes");
    return List.generate(notes.length, (index) {
      return Notes.fromJson(notes[index]);
    });
  }

  static Future<int> updateNote(Notes note) async {
    final db = await _getDB();
    return db.update(
      "Notes",
      note.toJson(),
      where: "id = ?",
      whereArgs: [note.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteNote(int id) async {
    final db = await _getDB();
    return db.delete("Notes", where: "id = ?", whereArgs: [id]);
  }
}
