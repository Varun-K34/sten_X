import 'package:hive_flutter/adapters.dart';
import 'package:varun_s_application20/database/signup_db.dart';

const AUTHENTICATION_DB = 'logindb';

Future<void> addlogindetails(Signupdb value) async {
  // ignore: non_constant_identifier_names
  final _login_db = await Hive.openBox<Signupdb>(AUTHENTICATION_DB);
  await _login_db.put(value.id, value);
  print(_login_db);
}

Future<List<Signupdb>>getlogindetails()async{
  // ignore: non_constant_identifier_names
  final _login_db = await Hive.openBox<Signupdb>(AUTHENTICATION_DB);
   List<Signupdb> data =  _login_db.values.toList().cast<Signupdb>();
  return data;
}