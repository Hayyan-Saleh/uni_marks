import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/domain/marks.dart';
import 'package:uni_marks/front_end/home_page.dart';

class AddMarkWindow extends StatelessWidget {
  const AddMarkWindow({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController yearController = TextEditingController();
    TextEditingController termController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController markTheoriticalController = TextEditingController();
    TextEditingController markPracticalController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          shadowColor: Colors.deepPurple,
          title: const Text(
            "Add Mark",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(30, 52, 147, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                  hintText: "year",
                  inputType: TextInputType.number,
                  controller: yearController),
              CustomTextField(
                  hintText: "term",
                  inputType: TextInputType.number,
                  controller: termController),
              CustomTextField(
                  hintText: "name",
                  inputType: TextInputType.text,
                  controller: nameController),
              CustomTextField(
                  hintText: "mark theoritical",
                  inputType: TextInputType.number,
                  controller: markTheoriticalController),
              CustomTextField(
                  hintText: "mark practical",
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
                                                color: Colors.black, width: 1),
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
                                                    BorderRadius.circular(20)),
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
                                  markPractical: markPracticalController
                                          .text.isEmpty
                                      ? 0
                                      : int.parse(markPracticalController.text),
                                  markTheoritical:
                                      markPracticalController.text.isEmpty
                                          ? 0
                                          : int.parse(
                                              markTheoriticalController.text));
                              if (marksListDataBase.get(0) == null) {
                                marksListDataBase.put(
                                    0, Marks(marks: [newMark]));
                              } else {
                                Marks marksList = marksListDataBase.getAt(0);
                                marksList.marks.add(newMark);
                                marksList.sort();
                                marksListDataBase.put(0, marksList);
                              }
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "Successfully added ${newMark.name} to your marks"),
                                duration: const Duration(seconds: 3),
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 176, 6),
                              ));
                              Navigator.of(context).pop();
                            }
                          },
                          text: "save mark to my marks",
                          backgroundColor: Colors.purple),
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
