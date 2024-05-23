import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedContainerApp());
}

class AnimatedContainerApp extends StatelessWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: AnimatedContainerWidget(),
        ),
      ),
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100.0;
  double _width = 100.0;

  void _increaseWidth() {
    setState(() {
      _width = _width >= 320.0 ? 100.0 : _width += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          color: Colors.amber,
          height: _height,
          width: _width,
          // transform: Matrix4.rotationX(20),
          // constraints: BoxConstraints.expand(width: 100 , height: 100),
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text('Tap to\nGrow Width\n$_width'),
            onPressed: _increaseWidth,
          ),
        ),
      ],
    );
  }
}
