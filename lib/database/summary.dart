// ignore_for_file: duplicate_ignore, camel_case_types

import 'package:hive_flutter/adapters.dart';
part 'summary.g.dart';

// ignore: camel_case_types, camel_case_types
@HiveType(typeId: 2)
class summarytext {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String text;

  summarytext({
    required this.id,
    required this.name,
    required this.text,
  });
}
