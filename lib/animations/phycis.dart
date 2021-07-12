import 'package:flutter/material.dart';

class AnimationPhysics extends StatefulWidget {
  AnimationPhysics({Key? key}) : super(key: key);

  @override
  _AnimationPhysicsState createState() => _AnimationPhysicsState();
}

class _AnimationPhysicsState extends State<AnimationPhysics>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Offset position = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Physics'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onPanUpdate: (update) {
            setState(() {
              position = Offset(
                update.localPosition.dx - 50,
                update.localPosition.dy - 50,
              );
            });
          },
          child: Transform.translate(
            offset: position,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
