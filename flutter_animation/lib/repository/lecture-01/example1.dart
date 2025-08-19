import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animation/repository/uihelper/uihelper.dart';

class RotatedTriangle extends StatefulWidget {
  const RotatedTriangle({super.key});

  @override
  State<RotatedTriangle> createState() => _RotatedTriangleState();
}

class _RotatedTriangleState extends State<RotatedTriangle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
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
        elevation: 0,
        title: const Center(child: Text('Example 01')),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))
                  ]),
            ),
          );
        },
      )),
      floatingActionButton:
          UiHelper.customButton(callback: () {}, text: 'Next'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
