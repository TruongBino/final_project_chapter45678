import 'package:final_project_chapter45678/chapter6/exercieschap6/constant/String.dart';
import 'package:final_project_chapter45678/chapter6/projectchap6/prj/column_example.dart';
import 'package:final_project_chapter45678/chapter6/projectchap6/prj/decorator_example.dart';
import 'package:final_project_chapter45678/chapter6/projectchap6/prj/layoutbuilder_example.dart';
import 'package:final_project_chapter45678/chapter6/projectchap6/prj/row_example.dart';
import 'package:flutter/material.dart';

final Map<String,Widget Function(BuildContext)> routes = {
  'prj6':(context) => const MyApp(),
  'column':(context) => const ColumnWidgetExample(),
  'row':(context) => const RowWidgetExample(),
  'decorator':(context) => const DecoratorWidgetExample(),
  'layoutBuilder':(context) => const LayoutBuilderExample(),
};
void main(){
  runApp(const ProjectChap6());
}
class ProjectChap6 extends StatelessWidget{
  const ProjectChap6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 6',
      initialRoute: 'prj6',
      routes: routes,
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        buildElevatedButton(context, AppString.column, 'column'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.row, 'row'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.decorator, 'decorator'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.layoutBuilder, 'layoutBuilder'),
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