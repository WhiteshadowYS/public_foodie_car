import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double height;
  final String title;

  MainAppBar({
    this.title,
    this.height = 50.0,
  }) : preferredSize = Size.fromHeight(height), super(key: Key('MainAppBar'));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff16191D),
      child: SafeArea(
        top: true,
        child: Container(
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
              height: 1.3,
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
