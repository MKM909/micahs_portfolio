import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micahs_portfolio/widgets/responsive_widget.dart';

class MenuItem extends StatefulWidget {

  final String title;
  final bool isActive;

  const MenuItem({super.key, required this.isActive, required this.title});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 350;
    return ResponsiveWidget(
      desktop: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedScale(
          scale: isHovering ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            padding: isHovering ? EdgeInsets.all(5) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isHovering ? Color(0xFFF4EBDD) : Colors.transparent,
              boxShadow: [
                if (isHovering)
                  BoxShadow(
                    color: Colors.teal.shade900.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.isActive ? Text(
                        '(',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                      widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                      Text(
                        widget.title.toUpperCase(),
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          color: widget.isActive ? Colors.teal.shade900 : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                      widget.isActive ? Text(
                        ')',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      mobile: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            padding: isHovering ? EdgeInsets.all(2) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isHovering ? Color(0xFFF4EBDD) : Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: EdgeInsets.all(5 * fontScale),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.isActive ? Text(
                        '(',
                        style: GoogleFonts.quicksand(
                          fontSize: 17 * fontScale,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                      widget.isActive ? SizedBox(width: 5 * fontScale,) : SizedBox(),
                      Text(
                        widget.title.toUpperCase(),
                        style: GoogleFonts.quicksand(
                          fontSize: 16 * fontScale,
                          color: widget.isActive ? Colors.teal.shade900 : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.isActive ? SizedBox(width: 5 * fontScale,) : SizedBox(),
                      widget.isActive ? Text(
                        ')',
                        style: GoogleFonts.quicksand(
                          fontSize: 17 * fontScale,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      tablet: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: isHovering ? EdgeInsets.all(2) : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isHovering ? Color(0xFFF4EBDD) : Colors.transparent,
            boxShadow: [
              if (isHovering)
                BoxShadow(
                  color: Colors.teal.shade900.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isActive ? Text(
                      '(',
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ) : SizedBox(),
                    widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                    Text(
                      widget.title.toUpperCase(),
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: widget.isActive ? Colors.teal.shade900 : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                    widget.isActive ? Text(
                      ')',
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ) : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      tabletVertical: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: AnimatedScale(
          scale: isHovering ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            padding: isHovering ? EdgeInsets.all(5) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isHovering ? Color(0xFFF4EBDD) : Colors.transparent,
              boxShadow: [
                if (isHovering)
                  BoxShadow(
                    color: Colors.teal.shade900.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.isActive ? Text(
                        '(',
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                      widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                      Text(
                        widget.title.toUpperCase(),
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: widget.isActive ? Colors.teal.shade900 : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.isActive ? SizedBox(width: 5,) : SizedBox(),
                      widget.isActive ? Text(
                        ')',
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
