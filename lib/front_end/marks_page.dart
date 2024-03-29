import 'package:flutter/material.dart';
import 'package:uni_marks/data_base/boxes.dart';

class MarksPage extends StatelessWidget {
  const MarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return marksListDataBase.get(0) == null
        ? const Center(
            child: Text(
              "No Marks Yet",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Table(
                border: TableBorder.all(
                    color: Color.fromRGBO(255, 63, 249, 1), width: 1),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 210, 192, 0)),
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Year",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Term",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Mark P",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Mark T",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ]),
                  ...List.generate(
                      marksListDataBase.get(0).marks.length,
                      (index) => TableRow(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 59, 48, 186)),
                              children: [
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${marksListDataBase.get(0).marks.elementAt(index).year}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${marksListDataBase.get(0).marks.elementAt(index).term}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${marksListDataBase.get(0).marks.elementAt(index).name}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${marksListDataBase.get(0).marks.elementAt(index).markPractical}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${marksListDataBase.get(0).marks.elementAt(index).markTheoritical}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                              ]))
                ],
              ),
            ),
          );
  }
}
