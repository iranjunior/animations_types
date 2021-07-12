import 'package:flutter/material.dart';


class AnimationImplicit extends StatefulWidget {
  AnimationImplicit({Key? key}) : super(key: key);

  @override
  _AnimationImplicitState createState() => _AnimationImplicitState();
}

class _AnimationImplicitState extends State<AnimationImplicit> {
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Implicit'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: _active ? 0 : 100,
          width: _active ? 0 : 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.bolt),
        onPressed: () {
          setState(() {
            _active = !_active;
          });
        },
      ),
    );
  }
}
