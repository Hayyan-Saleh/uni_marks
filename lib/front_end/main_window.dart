import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/marks_page.dart';
import 'package:uni_marks/front_end/settings_page.dart';
import 'package:uni_marks/front_end/show_searched_mark_window.dart';

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
  List<Color> colors = [
    Colors.purple,
    const Color.fromARGB(255, 151, 136, 0),
    const Color.fromARGB(255, 0, 114, 168)
  ];
  List<Widget> pages = [
    HomePage(scaffoldKey: scaffoldKey),
    const MarksPage(),
    const Settings()
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
          Mark? mark = marksListDataBase.get(0).getMarkByName(text);
          if (mark != null) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
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
            ));
          }
        },
        openOverlayOnSearch: true,
        searchBackgroundColor: Colors.white,
        suggestionBackgroundColor: Colors.white,
        elevation: 20,
        suggestionsElevation: 10,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors.elementAt(_currentIndex),
        searchHintText: "Search a mark ...",
        onSuggestionTap: (selectedMarkName) {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
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
          ));
        },
        suggestions: marksListDataBase.get(0) == null
            ? []
            : [...marksListDataBase.get(0).getMarksNamesList()],
      ),
      backgroundColor: Colors.grey,
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
            selectedColor: Colors.purple,
          ),

          /// Marks
          SalomonBottomBarItem(
            icon: const Icon(Icons.list_alt_outlined),
            title: const Text("Marks"),
            selectedColor: Colors.yellow,
          ),

          /// Year
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
