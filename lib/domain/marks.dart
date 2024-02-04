import 'package:hive/hive.dart';
import 'package:uni_marks/domain/mark.dart';

part 'marks.g.dart';

@HiveType(typeId: 2)
class Marks {
  Marks({required this.marks});
  @HiveField(0)
  List<Mark> marks;
  double getYearAvg(int year) {
    int sum = 0;
    int counter = 0;
    for (Mark mark in marks) {
      if (mark.year == year) {
        sum += mark.markPractical + mark.markTheoritical;
        counter++;
      }
    }
    return sum / counter;
  }

  List<String>? getMarksNamesList() {
    List<String> marksNames = [];
    for (Mark mark in marks) marksNames.add(mark.name);
    return marksNames;
  }

  void sort() {
    marks.sort((a, b) => a.year.compareTo(b.year));
  }

  Mark? getMarkByName(String name) {
    for (Mark mark in marks) if (mark.name == name) return mark;
    return null;
  }

  double getYearTermAvg(int year, int term) {
    int sum = 0;
    int counter = 0;
    for (Mark mark in marks) {
      if (mark.year == year && mark.term == term) {
        sum += mark.markPractical + mark.markTheoritical;
        counter++;
      }
    }
    return sum / counter;
  }

  @override
  String toString() {
    String marksString = "";
    for (Mark mark in marks) {
      marksString += "\n $mark";
    }
    return marksString;
  }
}
