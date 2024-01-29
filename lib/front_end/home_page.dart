import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/front_end/add_mark_window.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.scaffoldKey});
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Student : ${userDataBase.get(0).name}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "University : ${userDataBase.get(0).university}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const AddMarkWindow(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                      text: "Add Marks",
                      backgroundColor: Colors.purple),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomButton(
                        onPressed: () {
                          TextEditingController yearController =
                              TextEditingController();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 125, 125, 125),
                                    title: const Text(
                                      "Get Marks Avg",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: CustomTextField(
                                      controller: yearController,
                                      hintText: "Year",
                                      inputType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          if (yearController.text.isNotEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                "The Avg for year ${yearController.text} is : ${marksListDataBase.get(0).getYearAvg(int.parse(yearController.text))}",
                                              ),
                                              backgroundColor: Colors.black,
                                              duration:
                                                  const Duration(seconds: 10),
                                            ));
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        color: Colors.green,
                                        child: const Text(
                                          "show avg",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.red,
                                        child: const Text(
                                          "Exit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ));
                        },
                        text: "Get Year Avg",
                        backgroundColor: Colors.green)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                        onPressed: () {
                          TextEditingController yearController =
                              TextEditingController();
                          TextEditingController termController =
                              TextEditingController();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 125, 125, 125),
                                    title: Column(
                                      children: [
                                        const Text(
                                          "Get Marks Avg",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        CustomTextField(
                                            hintText: "Year",
                                            inputType: TextInputType.number,
                                            controller: yearController)
                                      ],
                                    ),
                                    content: CustomTextField(
                                      controller: termController,
                                      hintText: "Term",
                                      inputType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          if (yearController.text.isNotEmpty &&
                                              termController.text.isNotEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                "The Avg for year ${yearController.text} and term ${termController.text} \n is : ${marksListDataBase.get(0).getYearTermAvg(int.parse(yearController.text), int.parse(termController.text))}",
                                              ),
                                              backgroundColor: Colors.black,
                                              duration:
                                                  const Duration(seconds: 10),
                                            ));
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        color: Colors.green,
                                        child: const Text(
                                          "show avg",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.red,
                                        child: const Text(
                                          "Exit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ));
                        },
                        text: "Get Term Avg",
                        backgroundColor: Colors.green)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                      onPressed: () {
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
                                    "Removing Marks",
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 20),
                                  ),
                                  content: const Text(
                                    "Are You sure You want to delete All of your marks ?\n\nYOU WILL NOT BE ABLE TO RETRIEV THEM AGAIN !",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        marksListDataBase.clear();
                                        Navigator.of(context).pop();
                                      },
                                      color: Colors.green,
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: Colors.red,
                                      child: const Text(
                                        "No",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ));
                      },
                      text: "Remove Marks",
                      backgroundColor: Colors.red),
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 74, 78, 200),
                                  title: const Text(
                                    "About the Developer",
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 20),
                                  ),
                                  content: const Text(
                                    "This Simple Marks Project was done by Hayyan Saleh ! \n\nMy accounts :\n\nlinked in : https://www.linkedin.com/in/hayyan-saleh \n\nfacebook : https://www.facebook.com/hayyan.saleh.940 \n\nGithub : https://github.com/Hayyan-Saleh",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: Colors.pink,
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      text: "About",
                      backgroundColor: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.backgroundColor});
  // ignore: prefer_typing_uninitialized_variables
  var onPressed;
  String text;
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.black, width: 1)),
      onPressed: onPressed,
      color: backgroundColor,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
