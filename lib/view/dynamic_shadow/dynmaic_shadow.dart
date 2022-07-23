import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicShadow extends StatefulWidget {
  const DynamicShadow({Key? key}) : super(key: key);
  static const routeName = '/dynamic_shadow';

  @override
  State<DynamicShadow> createState() => _DynamicShadowState();
}

class _DynamicShadowState extends State<DynamicShadow> {
  double x = 0;
  double y = 0;
  double z = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        title: const Text('Dynamic Shadow'),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              double dy = y + details.delta.dx / 500000;
              y = dy.clamp(-.0003, .0003);
              double dx = x + details.delta.dy / 500000;
              x = dx.clamp(-.0003, .0003);
            });
          },
          child: Transform(
            transform: Matrix4(1, 0, 0, y, 0, 1, 0, x, 0, 0, 1, 0, 0, 0, 0, 1),
            // ..rotateX(x)
            // ..rotateY(y)
            // ..rotateZ(z),
            alignment: FractionalOffset.center,
            child: Container(
              height: 240,
              margin: const EdgeInsets.all(48),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.1),
                    offset: Offset(40000 * x, 0),
                    blurRadius: 80000 * y.abs(),
                    spreadRadius: 48000 * y.abs(),
                  ),
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.1),
                    offset: Offset(80000 * -y, 0),
                    blurRadius: 80000 * y.abs(),
                    spreadRadius: 48000 * y.abs(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
