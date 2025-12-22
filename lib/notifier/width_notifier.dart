import 'package:flutter/material.dart';

class WidthNotifier extends ChangeNotifier {
  final AnimationController animationController;

  double? _lastBreakpoint;

  WidthNotifier({required this.animationController});

  void checkWidth(double width, VoidCallback onTypingStart) {
    double breakpoint;

    if (width >= 1002) {
      breakpoint = 1002;
    } else if (width >= 790) {
      breakpoint = 790;
    } else if (width >= 600) {
      breakpoint = 600;
    } else {
      breakpoint = 0; // Below 600
    }

    // Only trigger if we crossed into a new breakpoint
    if (_lastBreakpoint != breakpoint) {
      _lastBreakpoint = breakpoint;

      // Reset & start animation
      animationController.reset();
      animationController.forward();

      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          onTypingStart();
        }
      });
    }
  }
}