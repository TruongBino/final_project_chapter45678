import 'package:flutter/material.dart';

void main() {
  runApp(const CrossFadeAnimated());
}

class CrossFadeAnimated extends StatelessWidget {
  const CrossFadeAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedCrossFadeWidget(
        key: UniqueKey(), // Provide a unique key to AnimatedCrossFadeWidget
      ),
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({
    required Key key,
  }) : super(key: key);

  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade Example'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  firstCurve: Curves.linear,
                  secondCurve: Curves.linear,
                  sizeCurve: Curves.linear,
                  alignment: Alignment.center,
                  reverseDuration: const Duration(milliseconds: 500),
                  crossFadeState: _crossFadeStateShowFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Container(
                    color: Colors.amber,
                    height: 100.0,
                    width: 100.0,
                  ),
                  secondChild: Container(
                    color: Colors.lime,
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                Positioned.fill(
                  child: TextButton(
                    onPressed: () {
                      _crossFade();
                    },
                    child: const Text('Tap to\nFade Color & Size'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
