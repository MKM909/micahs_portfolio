import 'package:flutter/material.dart';

class ResponsiveWidget extends StatefulWidget {

  final Widget desktop;
  final Widget mobile;
  final Widget tablet;
  final Widget tabletVertical;

  const ResponsiveWidget({super.key, required this.desktop, required this.mobile, required this.tablet, required this.tabletVertical,});

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 1002) {
      return widget.desktop;
    } else if (MediaQuery.of(context).size.width >= 800) {
      return widget.tablet;
    } else if (MediaQuery.of(context).size.width >= 590) {
      return widget.tabletVertical;
    } else {
      return widget.mobile;
    }
  }
}