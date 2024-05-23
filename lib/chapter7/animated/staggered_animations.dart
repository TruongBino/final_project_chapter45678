import 'package:flutter/material.dart';
import 'animated_baloon_staggered.dart';
void main() {
  runApp(const MaterialApp(
    home: StaggeredAnimations(),
  ));
}

class StaggeredAnimations extends StatelessWidget {
  const StaggeredAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animations Example'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                AnimatedBalloonWidgetStagered(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}