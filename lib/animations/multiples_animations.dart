import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AnimationMultiples extends StatefulWidget {
  AnimationMultiples({Key? key}) : super(key: key);

  @override
  _AnimationMultiplesState createState() => _AnimationMultiplesState();
}

class _AnimationMultiplesState extends State<AnimationMultiples>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _controller.value += details.delta.dx / 100;
      },
      onPanEnd: (details) {
        _controller.animateWith(
          FrictionSimulation(
            0.05,
            _controller.value,
            details.velocity.pixelsPerSecond.dx / 100,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animations Multiples'),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bottle.png'),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          builder: (context, child) {
            return Center(
              child: Transform.rotate(
                angle: _controller.value,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
