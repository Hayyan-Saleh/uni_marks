import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/front_end/about_window.dart';
import 'package:uni_marks/front_end/add_mark_window.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/marks_page.dart';
import 'package:uni_marks/front_end/statistics_page.dart';
import 'package:uni_marks/front_end/show_searched_mark_window.dart';
import 'package:uni_marks/front_end/user_first_window.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class MainWindow extends StatefulWidget {
  const MainWindow(
      {super.key,
      required SlideTransition Function(dynamic context, dynamic animation,
              dynamic secondaryAnimation, dynamic child)
          transitionsBuilder});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  int _currentIndex = 0;
  List<Color> appBarColors = [
    Colors.purple,
    Color.fromARGB(255, 205, 189, 48),
    const Color.fromARGB(255, 0, 114, 168)
  ];
  List<Color> backgroundColors = [
    Color.fromRGBO(30, 52, 147, 0.612),
    Color.fromRGBO(30, 52, 147, 0.612),
    Color.fromRGBO(109, 133, 238, 0.612)
  ];
  List<Widget> pages = [
    HomePage(scaffoldKey: scaffoldKey),
    const MarksPage(),
    const Statistics()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: EasySearchBar(
        searchClearIconTheme: IconThemeData(color: Colors.red),
        title: Center(
            child: const Text(
          "Uni Marks",
          style: TextStyle(color: Colors.white),
        )),
        onSearch: (text) {
          if (marksListDataBase.get(0) != null) {
            Mark? mark = marksListDataBase.get(0).getMarkByName(text);
            if (mark != null) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ShowSearchedMark(
                      mark: mark,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
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
                      },
                    ),
                  ),
                  (route) => false);
            }
          }
        },
        openOverlayOnSearch: true,
        searchBackgroundColor: appBarColors.elementAt(_currentIndex),
        suggestionTextStyle: TextStyle(
            wordSpacing: 5, color: Colors.white, fontWeight: FontWeight.bold),
        suggestionBackgroundColor: appBarColors.elementAt(_currentIndex),
        elevation: 20,
        suggestionsElevation: 10,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appBarColors.elementAt(_currentIndex),
        searchHintText: "Search a mark ...",
        searchBackIconTheme: IconThemeData(color: Colors.white),
        searchHintStyle: TextStyle(color: Colors.white),
        onSuggestionTap: (selectedMarkName) {
          Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ShowSearchedMark(
                mark: marksListDataBase.get(0).getMarkByName(selectedMarkName),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
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
                },
              ),
            ),
            (route) => false,
          );
        },
        suggestions: marksListDataBase.get(0) == null
            ? []
            : [...marksListDataBase.get(0).getMarksNamesList()],
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 56, 4, 199),
                Color.fromARGB(255, 45, 1, 148),
              ])),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "User : ${userDataBase.get(0).name}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "University : ${userDataBase.get(0).university}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.other_houses_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: CustomButton(
                              backgroundColor: Color.fromARGB(255, 60, 3, 193),
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    "Please search for the mark in the tab bar search icon then you can edit your mark ",
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 166, 66, 237),
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
                          child: CustomButton(
                            backgroundColor: Color.fromARGB(255, 46, 2, 150),
                            onPressed: () {
                              userDataBase.clear();
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      UserWindow(),
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
                            text: "Remove Student details",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Hero(
                              tag: "about",
                              child: CustomButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AboutWindow()));
                                  },
                                  text: "About",
                                  backgroundColor:
                                      Color.fromARGB(255, 36, 2, 117)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButton: _currentIndex != 0
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AddMarkWindow(),
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
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                  side: BorderSide(color: Color.fromARGB(255, 110, 149, 255))),
              backgroundColor: Color.fromRGBO(46, 78, 220, 1),
              child: Icon(Icons.add)),
      backgroundColor: backgroundColors.elementAt(_currentIndex),
      body: Hero(
        tag: "1",
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Color.fromARGB(255, 222, 55, 252),
              unselectedColor: Colors.purple),

          /// Marks
          SalomonBottomBarItem(
              icon: const Icon(Icons.list_alt_outlined),
              title: const Text("Marks"),
              selectedColor: Colors.yellow,
              unselectedColor: Color.fromARGB(255, 211, 195, 48)),

          /// statistics
          SalomonBottomBarItem(
              icon: const Icon(Icons.bolt),
              title: const Text("statistics"),
              selectedColor: Colors.blue,
              unselectedColor: Color.fromARGB(255, 15, 126, 182)),
        ],
      ),
    );
  }
}
