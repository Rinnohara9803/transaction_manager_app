import 'package:flutter/material.dart';

import 'screens/home_page.dart';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // final transactionDatabase = openDatabase(
  //   join(
  //     await getDatabasesPath(),
  //     'doggie_database.db',
  //   ),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       'CREATE TABLE transactions(id DATETIME PRIMARY KEY, title TEXT, amount INTEGER, date DATETIME)',
  //     );
  //   },
  //   version: 1,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
