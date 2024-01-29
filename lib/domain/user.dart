import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  User({required this.name, required this.university});
  @HiveField(0)
  String name;
  @HiveField(1)
  String university;
  get getName => name;
  get getUniversity => university;
  @override
  String toString() => "user : $name and uni : $university";
}
