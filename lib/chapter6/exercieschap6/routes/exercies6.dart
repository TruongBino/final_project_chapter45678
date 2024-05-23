import 'package:final_project_chapter45678/chapter6/exercieschap6/view/bai6.dart';
import 'package:final_project_chapter45678/chapter6/exercieschap6/view/bai7.dart';
import 'package:final_project_chapter45678/chapter6/exercieschap6/view/bai8.dart';
import 'package:flutter/material.dart';

import '../constant/String.dart';
import '../view/bai1.dart';
import '../view/bai2.dart';
import '../view/bai3.dart';
import '../view/bai4.dart';
import '../view/bai5.dart';

// danh sach cac man hinh (key, man hinh)
final Map<String, Widget Function(BuildContext)> routes = {
  'Giaibaitap': (context) => const MyApp(),
  'bai1' : (context) =>  const Bai1(),
  'bai2' : (context) =>  const Bai2(),
  'bai3' : (context) =>  const Bai3(),
  'bai4' : (context) =>  const Bai4(),
  'bai5' : (context) =>  const Bai5(),
  'bai6' : (context) =>  const Bai6(),
  'bai7' : (context) =>  const Bai7(),
  'bai8' : (context) =>  const Bai8(),
};

void main() {
  runApp(const ExcerciesChap6());
}

// class chinh
class ExcerciesChap6 extends StatelessWidget {
  const ExcerciesChap6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Example',
      initialRoute: 'Giaibaitap',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
// man hinh dau tien
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giải bài tập')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildColumn(context),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildElevatedButton(context,AppString.example_1,'bai1'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_2,'bai2'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_3,'bai3'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_4,'bai4'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_5,'bai5'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_6,'bai6'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_7,'bai7'),
        const Padding(padding: EdgeInsets.all(16.0)),
        buildElevatedButton(context,AppString.example_8,'bai8'),
        const Padding(padding: EdgeInsets.all(16.0)),
      ],
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context,String buttonText,String routerName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routerName);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), // Kích thước tối thiểu của nút
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      child: Text(buttonText),

    );
  }
}
