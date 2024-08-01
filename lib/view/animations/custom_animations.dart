import 'package:flutter/material.dart';

class CustomAnimations {

  Widget slideTransition(Animation<double> animation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  Widget fadeTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  Widget scaleTransition(Animation<double> animation, Widget child) {
    const curve = Curves.ease;

    var tween = Tween<double>(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: curve));
    var scaleAnimation = animation.drive(tween);

    return ScaleTransition(
      scale: scaleAnimation,
      child: child,
    );
  }

  Widget rotationTransition(Animation<double> animation, Widget child) {
    const curve = Curves.ease;

    var tween = Tween<double>(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: curve));
    var rotateAnimation = animation.drive(tween);

    return RotationTransition(
      turns: rotateAnimation,
      child: child,
    );
  }
}