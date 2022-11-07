import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(2)
  String qty;

  Task({
    required this.name,
    required this.price,
    required this.qty,
  });
}
