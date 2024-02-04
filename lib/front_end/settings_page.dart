import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/user_first_window.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  backgroundColor: Color.fromARGB(255, 16, 201, 139),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        "Please search for the mark in the tab bar search icon then you can edit your mark ",
                      ),
                      backgroundColor: Color.fromARGB(255, 16, 201, 139),
                      duration: Duration(seconds: 10),
                    ));
                  },
                  text: "Edit a mark",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  backgroundColor: const Color.fromARGB(255, 33, 128, 205),
                  onPressed: () {
                    userDataBase.clear();
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            UserWindow(),
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
                    );
                  },
                  text: "Remove Student details",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
