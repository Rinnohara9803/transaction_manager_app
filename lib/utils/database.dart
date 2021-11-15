import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:transaction_app/models/transaction.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final db = DatabaseProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        'transaction.db',
      ),
      onCreate: (db, version) {
        return db.execute('''
      CREATE TABLE transactions(
        id DATETIME PRIMARY KEY,
        title STRING,
        amount INTEGER,
        date DATETIME,
      );
      ''');
      },
      version: 1,
    );
  }

  newTransaction(Transactiona newTransaction) async {
    final db = await database;
    var res = await db!.rawInsert(
      '''
        INSERT INTO transactions (
          id, title, amount, date,
        ) VALUES (?, ?, ?, ?)
      ''',
      [
        newTransaction.id,
        newTransaction.title,
        newTransaction.amount,
        newTransaction.date
      ],
    );
    return res;
  }

  Future<List<Transactiona>?> getTransactions() async {
    final db = await database;
    final res = await db!.query('transactions');

    if (res.isEmpty) {
      return null;
    } else {
      List<Transactiona> theTransactions = List.generate(res.length, (index) {
        return Transactiona(
          id: res[index]['id'].toString(),
          title: res[index]['title'].toString(),
          amount: int.parse(res[index]['amount'].toString()),
          date: DateTime.parse(
            res[index]['date'].toString(),
          ),
        );
      });
      return theTransactions;
    }
  }
}
