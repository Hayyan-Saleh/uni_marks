import 'package:hive/hive.dart';
import 'package:uni_marks/data_base/boxes.dart';
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

  void removeMark(Mark mark) async {
    this.marks.remove(mark);
    await marksListDataBase.putAt(0, await new Marks(marks: this.marks));
  }

  void sort() {
    marks.sort((a, b) {
      int compareYearsResult = a.year.compareTo(b.year);
      if (compareYearsResult == 0) {
        return a.term.compareTo(b.term);
      } else {
        return compareYearsResult;
      }
    });
  }

  Mark? getMarkByName(String name) {
    for (Mark mark in marks) if (mark.name == name) return mark;
    return null;
  }

  Mark getBestMark() {
    Mark bestMark = marks[0];
    for (Mark mark in marks)
      if ((bestMark.markPractical + bestMark.markTheoritical) <
          (mark.markPractical + mark.markTheoritical)) bestMark = mark;
    return bestMark;
  }

  List<String> getBestYear() {
    List<String> yearDetailsList = [];
    double bestYearAvg = 0;
    for (Mark mark in marks) {
      double tempYearAvg = getYearAvg(mark.year);
      if (bestYearAvg < tempYearAvg) {
        bestYearAvg = tempYearAvg;
        yearDetailsList.clear();
        yearDetailsList.add("${mark.year}");
        yearDetailsList.add("${bestYearAvg.toInt()}");
      }
    }

    return yearDetailsList;
  }

  List<String> getBestTerm() {
    List<String> termDetailsList = [];
    double bestTermAvg = 0;
    for (Mark mark in marks) {
      double tempYearTermAvg = getYearTermAvg(mark.year, mark.term);
      if (bestTermAvg < tempYearTermAvg) {
        bestTermAvg = tempYearTermAvg;
        termDetailsList.clear();
        termDetailsList.add("${mark.year}");
        termDetailsList.add("${mark.term}");
        termDetailsList.add("${bestTermAvg.toInt()}");
      }
    }

    return termDetailsList;
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
