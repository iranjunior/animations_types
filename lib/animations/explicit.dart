import 'package:flutter/material.dart';

class AnimationExplicit extends StatefulWidget {
  AnimationExplicit({Key? key}) : super(key: key);
  @override
  _AnimationExplicitState createState() => _AnimationExplicitState();
}

class _AnimationExplicitState 
  extends State<AnimationExplicit>
    with SingleTickerProviderStateMixin {
      
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    // Cria uma animação que é regida por uma  curva
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Explicit'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: _animation,
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
    );
  }
}
