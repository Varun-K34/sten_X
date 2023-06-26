import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:varun_s_application20/database/summary.dart';

const SUMMARYTEXT = 'summary';

ValueNotifier<List<summarytext>> summarynotifier = ValueNotifier([]);

Future<void> summarytextadd(summarytext value) async {
  // ignore: non_constant_identifier_names
  final _summarydb = await Hive.openBox<summarytext>(SUMMARYTEXT);
  await _summarydb.put(value.id, value);
  print(_summarydb);
  //await _summarydb.close();
}

Future<List<summarytext>> getsummarydet() async {
  final _summarydb = await Hive.openBox<summarytext>(SUMMARYTEXT);
  return _summarydb.values.toList();
}
