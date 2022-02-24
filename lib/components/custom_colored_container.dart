import 'package:flutter/material.dart';
import 'package:githubrepositories/styles/style.dart';

class ColoredCustomContainer extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;

  // ignore: use_key_in_widget_constructors
  const ColoredCustomContainer({this.child,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [backgroundColor, whiteColor]),
          ),
      child: child,
    );
  }
}