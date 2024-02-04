import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/main_window.dart';

class EditMarkWindow extends StatelessWidget {
  EditMarkWindow({
    super.key,
    required this.mark,
  });
  Mark mark;
  @override
  Widget build(BuildContext context) {
    TextEditingController yearController = TextEditingController();
    TextEditingController termController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController markTheoriticalController = TextEditingController();
    TextEditingController markPracticalController = TextEditingController();
    return Hero(
      tag: "edit",
      child: Scaffold(
          appBar: AppBar(
            elevation: 20,
            centerTitle: true,
            shadowColor: Color.fromARGB(255, 17, 175, 122),
            title: const Text(
              "Edit Mark",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color.fromARGB(255, 16, 201, 139),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blueGrey,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                    hintText: "${mark.year}",
                    inputType: TextInputType.number,
                    controller: yearController),
                CustomTextField(
                    hintText: "${mark.term}",
                    inputType: TextInputType.number,
                    controller: termController),
                CustomTextField(
                    hintText: "${mark.name}",
                    inputType: TextInputType.text,
                    controller: nameController),
                CustomTextField(
                    hintText: "${mark.markTheoritical}",
                    inputType: TextInputType.number,
                    controller: markTheoriticalController),
                CustomTextField(
                    hintText: "${mark.markPractical}",
                    inputType: TextInputType.number,
                    controller: markPracticalController),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomButton(
                            onPressed: () {
                              if (nameController.text.isEmpty ||
                                  yearController.text.isEmpty ||
                                  termController.text.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: const Color.fromARGB(
                                              255, 125, 125, 125),
                                          title: const Text(
                                            "Missing data inputs",
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 20),
                                          ),
                                          content: const Text(
                                            "You need to fill in all the required input fields in order to continue !",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          actions: [
                                            MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: Colors.purple,
                                              child: const Text(
                                                "okay",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                    barrierDismissible: false);
                              } else {
                                Mark newMark = Mark(
                                    year: int.parse(yearController.text),
                                    term: int.parse(termController.text),
                                    name: nameController.text,
                                    markPractical:
                                        markPracticalController.text.isEmpty
                                            ? 0
                                            : int.parse(
                                                markPracticalController.text),
                                    markTheoritical: markPracticalController
                                            .text.isEmpty
                                        ? 0
                                        : int.parse(
                                            markTheoriticalController.text));
                                marksListDataBase.get(0).marks.remove(mark);
                                marksListDataBase.get(0).marks.add(newMark);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Successfully Edited ${newMark.name} in your marks"),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 176, 6),
                                ));
                                Navigator.of(context).pushAndRemoveUntil(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        MainWindow(
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            text: "save Edited Mark to my marks",
                            backgroundColor: Colors.purple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.controller});
  String hintText;
  TextInputType inputType;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: inputType,
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.yellow, width: 2))),
      ),
    );
  }
}
