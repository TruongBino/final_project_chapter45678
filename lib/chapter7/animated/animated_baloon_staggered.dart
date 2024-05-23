import 'package:flutter/material.dart';

class AnimatedBalloonWidgetStagered extends StatefulWidget {
  const AnimatedBalloonWidgetStagered({super.key});

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidgetStagered>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _animationFloatUp = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.elasticInOut),
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.reverse && _animationGrowSize.value < 0) {
        _controller.stop();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late double _balloonHeight;
  late double _balloonWidth;
  late double _balloonBottomLocation;

  @override
  Widget build(BuildContext context) {
    _balloonHeight = MediaQuery.of(context).size.height / 2;
    _balloonWidth = MediaQuery.of(context).size.width / 3;
    _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight;

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value < 0 ? 0 : _animationGrowSize.value,
          child: GestureDetector(
            onTap: () {
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: Image.asset(
              'assets/images/balloon.png',
              height: _balloonHeight,
              width: _balloonWidth,
            ),
          ),
        );
      },
    );
  }
}
