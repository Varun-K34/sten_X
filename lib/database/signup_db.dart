import 'package:hive_flutter/adapters.dart';
part 'signup_db.g.dart';

// ignore: camel_case_types
@HiveType(typeId: 1)
class Signupdb {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  Signupdb({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });
}
