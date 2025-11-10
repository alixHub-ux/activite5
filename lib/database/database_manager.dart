
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modele/redacteur.dart';

class DatabaseManager {
  static Database? _database;
  static const String _databaseName = 'redacteurs.db';
  static const int _databaseVersion = 1;

  // Table et colonnes
  static const String tableRedacteurs = 'redacteurs';
  static const String columnId = 'id';
  static const String columnNom = 'nom';
  static const String columnPrenom = 'prenom';
  static const String columnEmail = 'email';

  // Singleton
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableRedacteurs (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnNom TEXT NOT NULL,
        $columnPrenom TEXT NOT NULL,
        $columnEmail TEXT NOT NULL
      )
    ''');
  }

  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await database;
    final maps = await db.query(tableRedacteurs);
    return List.generate(maps.length, (i) => Redacteur.fromMap(maps[i]));
  }

  Future<int> insertRedacteur(Redacteur redacteur) async {
    final db = await database;
    return await db.insert(tableRedacteurs, redacteur.toMap());
  }

  Future<int> updateRedacteur(Redacteur redacteur) async {
    final db = await database;
    return await db.update(
      tableRedacteurs,
      redacteur.toMap(),
      where: '$columnId = ?',
      whereArgs: [redacteur.id],
    );
  }

  Future<int> deleteRedacteur(int id) async {
    final db = await database;
    return await db.delete(
      tableRedacteurs,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}

