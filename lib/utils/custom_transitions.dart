import 'package:flutter/material.dart';

class CustomTransitions {
  const CustomTransitions._();

  static const RouteTransitionsBuilder slideLeftWithFade = _slideLeftWithFade;

  static Widget _slideLeftWithFade(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeInOutCubic),
        ),
      ),
      child: child,
    );
  }

  static const RouteTransitionsBuilder slideRight = _slideRight;

  static Widget _slideRight(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeIn),
        ),
      ),
      child: child,
    );
  }

  static const RouteTransitionsBuilder fadeIn = _fadeIn;

  static Widget _fadeIn(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  static const RouteTransitionsBuilder zoomIn = _zoomIn;

  static Widget _zoomIn(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(scale: animation, child: child);
  }

  static const RouteTransitionsBuilder noTransition = _noTransition;

  static Widget _noTransition(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
