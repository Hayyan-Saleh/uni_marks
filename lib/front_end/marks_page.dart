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
                border: TableBorder.all(color: Colors.black, width: 2),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 201, 3)),
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Year"),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Term"),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Name"),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Mark P"),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Mark T"),
                            )),
                      ]),
                  ...List.generate(
                      marksListDataBase.get(0).marks.length,
                      (index) => TableRow(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 188, 82, 191)),
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
