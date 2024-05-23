import 'package:flutter/material.dart';

import 'animated_balloon.dart';
void main() {
  runApp(const AnimatedController());
}

class AnimatedController extends StatelessWidget {
  const AnimatedController({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  AnimatedBalloonWidget(), // Đảm bảo sử dụng AnimatedBalloonWidget ở đây
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
