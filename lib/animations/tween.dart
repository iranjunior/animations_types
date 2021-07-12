import 'package:flutter/material.dart';

class AnimationTween extends StatefulWidget {
  AnimationTween({Key? key}) : super(key: key);

  @override
  _AnimationTweenState createState() => _AnimationTweenState();
}

class _AnimationTweenState extends State<AnimationTween>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animationScale;
  late final Animation<Color?> _animationColor;

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
    // Mesma definição do controller da página anterior
    _animationScale = Tween<double>(
      begin: 0.0,
      end: 100,
    ).animate(_controller);
    
    _animationColor = ColorTween(
      begin: Colors.green,
      end: Colors.blue,
    ).animate(_controller);

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
        title: Text('Animation Tween'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: _animationScale.value,
          width: _animationScale.value,
          decoration: BoxDecoration(
            color: _animationColor.value,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
