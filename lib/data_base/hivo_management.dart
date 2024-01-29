import 'package:hive_flutter/adapters.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/domain/marks.dart';
import 'package:uni_marks/domain/user.dart';

Future<Box> initializeDataBase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MarkAdapter());
  Hive.registerAdapter(MarksAdapter());
  Hive.registerAdapter(UserAdapter());
  marksDataBase = await Hive.openBox<Mark>("markBox");
  marksListDataBase = await Hive.openBox<Marks>("marksBox");
  userDataBase = await Hive.openBox<User>("userBox");
  return userDataBase;
}
