import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWindow extends StatelessWidget {
  const AboutWindow({super.key});

  Future<void> _launchUrl(String url) async {
    final parsedUrl = Uri.parse(url);
    try {
      await launchUrl(parsedUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "about",
      child: Scaffold(
        appBar: AppBar(
            elevation: 20,
            centerTitle: true,
            shadowColor: Color.fromARGB(255, 155, 39, 176),
            title: const Text(
              "Uni Marks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        backgroundColor: Color.fromRGBO(34, 13, 136, 1),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 31, 135, 220),
                      Colors.purple,
                      Colors.pink
                    ])),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "About the Developer",
                      style: TextStyle(
                          color: Color.fromARGB(255, 232, 232, 232),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: const Text(
                        "This Simple Marks Project was done by Hayyan Saleh ! \n\nMy accounts :\n\nfacebook : https://www.facebook.com/hayyan.saleh.940 \n\nGithub : https://github.com/Hayyan-Saleh \n\nlinked in : https://www.linkedin.com/in/hayyan-saleh-6476b1267/ \n\n*you can click any Icon below to open the URl",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 158, 158, 158),
                      Color.fromARGB(255, 113, 25, 100),
                      Color.fromARGB(255, 20, 59, 178)
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      elevation: 20,
                      onPressed: () async {
                        await _launchUrl(
                            "https://www.facebook.com/hayyan.saleh.940");
                      },
                      color: Color.fromARGB(255, 226, 242, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360)),
                      child: const Text(
                        "f",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      elevation: 20,
                      onPressed: () async {
                        await _launchUrl("https://github.com/Hayyan-Saleh");
                      },
                      color: Color.fromARGB(255, 186, 0, 177),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360)),
                      child: const Text(
                        "GitHub",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      elevation: 20,
                      onPressed: () async {
                        await _launchUrl(
                            "https://www.linkedin.com/in/hayyan-saleh-6476b1267/");
                      },
                      color: const Color.fromARGB(255, 9, 93, 161),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360)),
                      child: const Text(
                        "in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
