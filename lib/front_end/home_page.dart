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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                                        backgroundColor:
                                            Color.fromRGBO(34, 55, 145, 1),
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
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              if (yearController
                                                  .text.isNotEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    "The Avg for year ${yearController.text} is : ${marksListDataBase.get(0).getYearAvg(int.parse(yearController.text)).toInt()}",
                                                  ),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          139, 0, 203, 0.612),
                                                  duration: const Duration(
                                                      seconds: 10),
                                                ));
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            color: Colors.green,
                                            child: const Text(
                                              "show avg",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.red,
                                            child: const Text(
                                              "Exit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            text: "Get Year Avg",
                            backgroundColor: Color.fromARGB(255, 21, 83, 163))),
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
                                        backgroundColor:
                                            Color.fromRGBO(38, 58, 150, 1),
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
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              if (yearController
                                                      .text.isNotEmpty &&
                                                  termController
                                                      .text.isNotEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                    "The Avg for year ${yearController.text} and term ${termController.text} \n is : ${marksListDataBase.get(0).getYearTermAvg(int.parse(yearController.text), int.parse(termController.text)).toInt()}",
                                                  ),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          139, 0, 203, 0.612),
                                                  duration: const Duration(
                                                      seconds: 10),
                                                ));
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            color: Colors.green,
                                            child: const Text(
                                              "show avg",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.red,
                                            child: const Text(
                                              "Exit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            text: "Get Term Avg",
                            backgroundColor: Color.fromARGB(255, 21, 83, 163))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: CustomButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "Please search for the mark in the tab bar search icon then you can remove your mark ",
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 14, 130, 159),
                              duration: Duration(seconds: 5),
                            ));
                          },
                          text: "Remove single Mark",
                          backgroundColor: Color.fromARGB(255, 148, 21, 1)),
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
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      backgroundColor:
                                          Color.fromRGBO(44, 70, 187, 1),
                                      title: const Text(
                                        "Removing Marks",
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 20),
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
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          onPressed: () {
                                            marksListDataBase.clear();
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.green,
                                          child: const Text(
                                            "Yes",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.red,
                                          child: const Text(
                                            "No",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ));
                          },
                          text: "Remove All Marks",
                          backgroundColor: Color.fromARGB(255, 160, 22, 1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          side: const BorderSide(
              color: Color.fromARGB(255, 65, 132, 214), width: 1)),
      onPressed: onPressed,
      color: backgroundColor,
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 229, 229, 229), fontSize: 20),
      ),
    );
  }
}
