import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/user.dart';
import 'package:uni_marks/front_end/main_window.dart';

// ignore: must_be_immutable
class UserWindow extends StatelessWidget {
  UserWindow({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController universityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Welcome to Uni Marks !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "* Please fill the required data in order to Continue to the Application ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your name here",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 229, 208, 19),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter your University name here",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: universityNameController,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.school_rounded,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 229, 208, 19),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black))))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Hero(
              tag: "1",
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (userNameController.text.isEmpty ||
                      universityNameController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  const Color.fromARGB(255, 125, 125, 125),
                              title: const Text(
                                "Missing data inputs",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 20),
                              ),
                              content: const Text(
                                "You need to fill in all the required input fields in order to continue !",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              actions: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.purple,
                                  child: const Text(
                                    "okay",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                        barrierDismissible: false);
                  } else {
                    userDataBase.add(User(
                        name: userNameController.text,
                        university: universityNameController.text));
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MainWindow(transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                        }),
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
                  }
                },
                color: Colors.purple,
                child: const Text(
                  "Continue to the App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
