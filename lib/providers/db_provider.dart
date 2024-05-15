import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  // Defines a class DBProvider with a static nullable _database field of type Database.
  static Database? _database;
  // Creates a static instance db of DBProvider and initializes it with a private constructor _.
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path to DB
    //print('CREATING DATABASE...');
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //  getApplicationDocumentsDirectory ONLY WORKS ON ANDROID,
    //for IOS maybe use  getApplicationSupportDirectory,
    // for linux maybe use getHomeDirectory.
    //print(documentsDirectory.path);
    final path = join(documentsDirectory.path, 'ScansDB.db');
    //print(path);
    // Create DB
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans (
            id INTEGER PRIMARY KEY, 
            tipo TEXT, 
            valor TEXT
            )'''); // CREATE TABLE
    });
  }

  Future<int> newScanRaw(ScanModel newScanRaw) async {
    final id = newScanRaw.id;
    final tipo = newScanRaw.tipo;
    final valor = newScanRaw.valor;
    // Verify DB
    final db = await database;
    // INSERT
    final res = await db.rawInsert('''
    INSERT INTO Scans (id, tipo, valor)
    VALUES ($id, '$tipo', '$valor')
    ''');
    //print(res);
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    print('INSERTED ID: $res');
    return res;
  }
}
