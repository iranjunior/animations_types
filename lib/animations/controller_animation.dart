import 'package:flutter/material.dart';

class AnimationControlled extends StatefulWidget {
  AnimationControlled({Key? key}) : super(key: key);

  @override
  _AnimationControlledState createState() => _AnimationControlledState();
}

class _AnimationControlledState extends State<AnimationControlled>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
    _controller.forward();
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
        title: Text('Animation Controlled'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: _controller.value * 100,
          width: _controller.value * 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
