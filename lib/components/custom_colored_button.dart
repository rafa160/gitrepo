import 'package:flutter/material.dart';
import 'package:githubrepositories/styles/style.dart';

class CustomContainerButton extends StatelessWidget {

  final Widget widget;
  final VoidCallback onPressed;


  const CustomContainerButton({Key key, this.widget, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [pinkColor, purpleColor]),
            borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              primary: Colors.transparent,
              // onSurface: Colors.transparent,
              // shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            ),
            onPressed: onPressed,
            child: widget
        ),
      ),
    );
  }
}
