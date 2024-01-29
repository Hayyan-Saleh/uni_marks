import 'package:hive/hive.dart';

part 'mark.g.dart';

@HiveType(typeId: 1)
class Mark {
  Mark(
      {required this.term,
      required this.year,
      required this.name,
      required this.markPractical,
      required this.markTheoritical});
  @HiveField(0)
  String name;
//put get deleteAt clear .....
  @HiveField(1)
  int term;
  @HiveField(2)
  int year;
  @HiveField(3)
  int markTheoritical;
  @HiveField(4)
  int markPractical;
  @override
  String toString() {
    return "name : $name , term : $term , year : $year \nmarkTheoritical : $markTheoritical , markPractical : $markPractical";
  }
}
