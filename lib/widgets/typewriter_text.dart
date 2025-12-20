import 'dart:async';

import 'package:flutter/material.dart';

class HackerTypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final bool startTyping;

  const HackerTypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start,
    required this.startTyping,
  });

  @override
  State<HackerTypewriterText> createState() => _HackerTypewriterTextState();
}

class _HackerTypewriterTextState extends State<HackerTypewriterText>
    with SingleTickerProviderStateMixin {
  String _visibleText = "";
  int _index = 0;
  bool _showCursor = true;
  bool _hasStarted = false;
  bool _typingFinished = false;

  late AnimationController _cursorController;

  Timer? _cursorStopTimer;


  @override
  void initState() {
    super.initState();

    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _cursorController.addListener(() {
      if (mounted) setState(() => _showCursor = !_showCursor);
    });
  }

  @override
  void didUpdateWidget(covariant HackerTypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.startTyping && !_hasStarted) {
      _hasStarted = true;
      _startTyping();
    }
  }

  Future<void> _startTyping() async {
    final total = widget.text.length;

    while (_index < total) {
      double progress = _index / total;
      int delay = (24 + (progress * 90)).toInt();

      await Future.delayed(Duration(milliseconds: delay));
      if (!mounted) return;

      setState(() {
        _visibleText += widget.text[_index];
        _index++;
      });
    }

    // ✅ Typing finished ONLY after loop
    _typingFinished = true;

    // ⏱ Stop cursor blinking after 5 seconds
    _cursorStopTimer = Timer(const Duration(seconds: 0), () {
      if (!mounted) return;
      _cursorController.stop();
      setState(() {
        _showCursor = false;
      });
    });
  }


  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _typingFinished
          ? "$_visibleText${_showCursor ? '|' : ' '}"
          : "$_visibleText|",
      textAlign: widget.textAlign,
      style: widget.style,
    );
  }
}
