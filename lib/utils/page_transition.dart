library page_transition;

import 'package:flutter/material.dart';

enum PageTransitionType {
  fade,
  rightToLoeft,
}

class PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;
  final Curve curve;
  Alignment? alignment;
  final Duration duration;

  PageTransition(
      {required this.child,
      required this.type,
      this.curve = Curves.easeIn,
      this.alignment,
      this.duration = const Duration(milliseconds: 900)})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return child;
            },
            transitionDuration: duration,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              switch (type) {
                case PageTransitionType.rightToLoeft:
                  return SlideTransition(
                    transformHitTests: true,
                    position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0), end: Offset.zero)
                        .animate(animation),
                    child: SlideTransition(
                        child: child,
                        position: Tween<Offset>(
                                begin: Offset.zero,
                                end: const Offset(-1.0, 0.0))
                            .animate(secondaryAnimation)),
                  );
                // break;
                default:
                  return FadeTransition(opacity: animation, child: child);
              }
            });
}
