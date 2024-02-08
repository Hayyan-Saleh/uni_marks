import 'package:flutter/material.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/front_end/edit_mark_window.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/main_window.dart';

// ignore: must_be_immutable
class ShowSearchedMark extends StatelessWidget {
  ShowSearchedMark(
      {super.key,
      required this.mark,
      required SlideTransition Function(dynamic context, dynamic animation,
              dynamic secondaryAnimation, dynamic child)
          transitionsBuilder});
  Mark mark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 52, 147, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      MainWindow(
                    transitionsBuilder:
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
                    },
                  ),
                ),
                (route) => false);
          },
        ),
        elevation: 20,
        centerTitle: true,
        shadowColor: const Color.fromARGB(0, 155, 39, 176),
        title: const Text(
          "Uni Marks",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(0, 155, 39, 176),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(30, 52, 147, 0.612),
          Color.fromRGBO(30, 147, 108, 0.612)
        ])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    "${mark.name}",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.black45,
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Year : ${mark.year}               Term : ${mark.term}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.black45,
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Total Mark : ${mark.markTheoritical + mark.markPractical}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Mark Practical : ${mark.markPractical}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Mark Theoritical : ${mark.markTheoritical}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  color: Colors.black45,
                  height: 5,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    color: Color.fromARGB(0, 255, 14, 14),
                    height: 50),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Hero(
                        tag: "edit",
                        child: CustomButton(
                            backgroundColor: Color.fromARGB(255, 13, 161, 112),
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        EditMarkWindow(
                                  mark: mark,
                                ),
                              ));
                            },
                            text: "Edit this mark"),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
