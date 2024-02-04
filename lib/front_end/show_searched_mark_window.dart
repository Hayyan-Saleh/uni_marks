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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MainWindow(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            ));
          },
        ),
        elevation: 20,
        centerTitle: true,
        shadowColor: Colors.purple,
        title: const Text(
          "Uni Marks",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${mark.name}",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              color: Colors.black45,
              height: 3,
            ),
            Text(
              "Year : ${mark.year}               Term : ${mark.term}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
              color: Colors.black45,
              height: 3,
            ),
            Text(
              "Total Mark : ${mark.markTheoritical + mark.markPractical}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Mark Practical : ${mark.markPractical}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Mark Theoritical : ${mark.markTheoritical}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
              color: Colors.black45,
              height: 3,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Hero(
                    tag: "edit",
                    child: CustomButton(
                        backgroundColor: Color.fromARGB(255, 16, 201, 139),
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
            )
          ],
        ),
      ),
    );
  }
}
