// lib/database/database_manager_web.dart

import 'package:sembast_web/sembast_web.dart';
import '../modele/redacteur.dart';

class DatabaseManager {
  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  static const String _databaseName = 'redacteurs.db';
  static const String _storeName = 'redacteurs_store';

  final DatabaseFactory _dbFactory = databaseFactoryWeb;
  final _store = intMapStoreFactory.store(_storeName);
  Database? _db;

  Future<Database> get _database async {
    if (_db != null) return _db!;
    _db = await _dbFactory.openDatabase(_databaseName);
    return _db!;
  }

  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await _database;
    final records = await _store.find(db);
    return records.map((r) {
      final map = Map<String, dynamic>.from(r.value);
      map['id'] = map['id'] ?? r.key;
      return Redacteur.fromMap(map);
    }).toList();
  }

  Future<int> insertRedacteur(Redacteur redacteur) async {
    final db = await _database;
    final key = await _store.add(db, redacteur.toMap());
    return key;
  }

  Future<int> updateRedacteur(Redacteur redacteur) async {
    final db = await _database;
    if (redacteur.id == null) return 0;
    final finder = Finder(filter: Filter.byKey(redacteur.id));
    final count = await _store.update(db, redacteur.toMap(), finder: finder);
    return count;
  }

  Future<int> deleteRedacteur(int id) async {
    final db = await _database;
    final finder = Finder(filter: Filter.byKey(id));
    final count = await _store.delete(db, finder: finder);
    return count;
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
