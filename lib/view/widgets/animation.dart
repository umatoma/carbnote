import 'package:flutter/material.dart';

class CnScaleSwitcher extends StatelessWidget {
  const CnScaleSwitcher({
    Key key,
    this.duration = const Duration(milliseconds: 300),
    @required this.child,
  }) : super(key: key);

  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation.drive(
            CurveTween(curve: Curves.easeInOutBack),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}

class CnFadeSwitcher extends StatelessWidget {
  const CnFadeSwitcher({
    Key key,
    this.duration = const Duration(milliseconds: 300),
    @required this.child,
  }) : super(key: key);

  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation.drive(
            CurveTween(curve: Curves.easeInOutBack),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
