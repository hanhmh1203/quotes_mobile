import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'quote_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quotes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quotes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote TEXT,
        author TEXT,
        type TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getQuotes() async {
    final db = await database;
    return await db.query('quotes');
  }

  Future<void> insertQuote(String quote, String author, String type) async {
    final db = await database;
    await db.insert(
      'quotes',
      {'quote': quote, 'author': author, 'type': type},
    );
  }
}
