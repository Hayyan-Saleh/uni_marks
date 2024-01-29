import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uni_marks/front_end/home_page.dart';
import 'package:uni_marks/front_end/marks_page.dart';
import 'package:uni_marks/front_end/settings_page.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

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
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        shadowColor: colors.elementAt(_currentIndex),
        title: const Text(
          "Uni Marks",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: colors.elementAt(_currentIndex),
      ),
      backgroundColor: Colors.grey,
      body: pages.elementAt(_currentIndex),
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
