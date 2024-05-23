import 'package:final_project_chapter45678/chapter6/exercieschap6/constant/String.dart';
import 'package:final_project_chapter45678/chapter6/exercieschap6/routes/exercies6.dart';
import 'package:final_project_chapter45678/chapter6/projectchap6/prj/project6.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'chapter6': (context) => const Chapter6(),
  'exercises6': (context) => const ExcerciesChap6(),
  'project6': (context) => const ProjectChap6(),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 6',
      initialRoute: 'chapter6',
      routes: routes,
    );
  }
}

class Chapter6 extends StatelessWidget {
  const Chapter6({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildColumn(context),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildElevatedButton(context, AppString.exerscies_6, 'exercises6'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.project_6, 'project6'),
        const Padding(padding: EdgeInsets.all(10.0)),
      ],
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, String buttonText,
      String routerName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routerName);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(buttonText),
    );
  }
}
