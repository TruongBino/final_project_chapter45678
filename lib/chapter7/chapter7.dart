import 'package:final_project_chapter45678/chapter7/animated/animated_container.dart';
import 'package:final_project_chapter45678/chapter7/animated/animated_controller.dart';
import 'package:final_project_chapter45678/chapter7/animated/animated_cross_fade.dart';
import 'package:final_project_chapter45678/chapter7/animated/animated_opacity.dart';
import 'package:final_project_chapter45678/chapter7/animated/staggered_animations.dart';
import 'package:flutter/material.dart';
import '../chapter6/exercieschap6/constant/String.dart';


final Map<String,Widget Function(BuildContext)> routes = {
  'chapter7':(context) => const MyApp(),
  'animated_container':(context) => const AnimatedContainerApp(),
  'animated_opacity':(context) => const AnimatedOpacityApp(),
  'animated_controller':(context) => const AnimatedController(),
  'animated_cross_fade':(context) => const CrossFadeAnimated(),
  'staggered_animations':(context) => const StaggeredAnimations(),
};
void main(){
  runApp(const Chapter7());
}
class Chapter7 extends StatelessWidget{
  const Chapter7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 7',
      initialRoute: 'chapter7',
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
        buildElevatedButton(context, AppString.container, 'animated_container'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.opacity, 'animated_opacity'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.controller, 'animated_controller'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.crossfade, 'animated_cross_fade'),
        const Padding(padding: EdgeInsets.all(10.0)),
        buildElevatedButton(context, AppString.staggered, 'staggered_animations'),
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