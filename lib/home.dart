
import 'package:final_project_chapter45678/chapter4/chapter4.dart';
import 'package:final_project_chapter45678/chapter5/chapter5.dart';
import 'package:final_project_chapter45678/chapter6/exercieschap6/constant/String.dart';
import 'package:final_project_chapter45678/chapter8/chap8.dart';
import 'package:flutter/material.dart';

import 'chapter6/chapter6.dart';
import 'chapter7/chapter7.dart';

final Map<String,Widget Function(BuildContext)> routes = {
  'finalproject45678':(context) => FinalProject45678(),
  'chapter4':(context) => const Chapter4(),
  'chapter5':(context) => const Chapter5(),
  'chapter6':(context) => const Chapter6(),
  'chapter7':(context) => const Chapter7(),
  'chapter8':(context) => const Chapter8(),

};
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Project 45678',
      initialRoute: 'finalproject45678',
      routes: routes,
    );
  }
}
class FinalProject45678 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(10.0),
          child: buildColumn(context),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildElevatedButton(context, AppString.chapter_4, 'chapter4'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.chapter_5, 'chapter5'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.chapter_6, 'chapter6'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.chapter_7, 'chapter7'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.chapter_8, 'chapter8'),
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
        // Kích thước tối thiểu của nút
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(buttonText),
    );
  }
}