import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uni_marks/data_base/hivo_management.dart';
import 'package:uni_marks/front_end/main_window.dart';
import 'package:uni_marks/front_end/user_first_window.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)))),
      home: FutureBuilder<Box>(
        future: initializeDataBase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return snapshot.data!.get(0) == null
                  ? UserWindow()
                  : MainWindow(transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Scaffold(
              appBar: AppBar(
                elevation: 20,
                centerTitle: true,
                shadowColor: Colors.deepPurple,
                title: const Text(
                  "Uni Marks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.purple,
              ),
              backgroundColor: Color.fromRGBO(30, 52, 147, 1),
              body: const Center(
                  child: CircularProgressIndicator(
                color: Colors.pink,
              )),
            );
          }
        },
      )));
}
