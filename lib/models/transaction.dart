import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Transaction {
  String id;
  String title;
  int amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
