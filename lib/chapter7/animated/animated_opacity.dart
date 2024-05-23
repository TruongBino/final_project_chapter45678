import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedOpacityApp());
}

class AnimatedOpacityApp extends StatelessWidget {
  const AnimatedOpacityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedOpacityWidget(
        key: UniqueKey(), // Provide a unique key to AnimatedCrossFadeWidget
      ),
    );
  }
}


class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({
    Key? key,
  }) : super(key: key);
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}
class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1.0;
  void _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.3 : 1.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _opacity,
          child: Container(
            color: Colors.amber,
            height: 100.0,
            width: 100.0,
            child: TextButton(
              onPressed: () {
                _animatedOpacity();
              },
              child: const Text('Tap to\nFade Color & Size'),
            ),
          ),
        ),
      ],
    );
  }
}