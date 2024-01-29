import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/user_first_window.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
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
    ));
  }
}
