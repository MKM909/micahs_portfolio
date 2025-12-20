import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micahs_portfolio/widgets/responsive_widget.dart';
import 'package:micahs_portfolio/widgets/typewriter_text.dart';

import 'menu_item.dart';

class CustomTabBar extends StatefulWidget {

  const CustomTabBar({super.key,});

  @override
  State<CustomTabBar> createState() => _TabBarState();
}

class _TabBarState extends State<CustomTabBar> with TickerProviderStateMixin{

  List<String> menuTabs = ['Services', 'Work', 'Notes', 'Experience'];

  bool startTyping = false;
  Duration animationDuration = const Duration(milliseconds: 800);
  late AnimationController animationController;

  bool menuOpen = false;
  late AnimationController menuAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration + Duration(milliseconds: 100),
    );

    animationController.forward(); // ✅ START IT

    animationController.addListener(() {
      if (animationController.isCompleted) {
        setState(() => startTyping = true);
      }
    });

    menuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );


  }

  void toggle() {
    setState(() {
      menuOpen = !menuOpen;
      menuOpen ? menuAnimationController.forward() : menuAnimationController
          .reverse();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 350;
    double scale = MediaQuery.of(context).size.width / 1600;

    return ResponsiveWidget(
      desktop: Container(
        padding: EdgeInsets.symmetric(vertical: 20 * scale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Expanded(
                  child: Text(
                    'Micah$screenWidth',
                    style: GoogleFonts.lobsterTwo(
                      fontWeight: FontWeight.w500,
                      fontSize: 45,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                menuTabs.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10 * scale),
                      child: MenuItem(
                                      isActive: index == 0,
                                      title: menuTabs[index],
                                     ),
                    ),
                )

            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HackerTypewriterText(
                      text: '+234 912 6433 601',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black
                      ),
                      startTyping: startTyping,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 4,
                                blurRadius: 8
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.phone,
                          color: Colors.teal.shade900,
                          size: 24 ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      mobile: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Color(0xFFF4EBDD).withValues(alpha: 0.5),
                  padding: EdgeInsets.symmetric(vertical: 5 * fontScale , horizontal: 20 * fontScale),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Expanded(
                            child: Text(
                              'Micah',
                              style: GoogleFonts.lobsterTwo(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 25 * fontScale,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
              
              
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
              
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1),
                                        spreadRadius: 4,
                                        blurRadius: 8
                                    )
                                  ]
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: toggle,
                                  splashColor: Colors.teal.shade900.withValues(alpha: 0.1),
                                  child: Padding(
                                    padding: EdgeInsets.all(8 * fontScale),
                                    child: AnimatedIcon(
                                      icon: AnimatedIcons.menu_close,
                                      color: Colors.teal.shade900,
                                      size: 12 * fontScale,
                                      progress: menuAnimationController,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 1 * fontScale,
              width: double.infinity,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 20 * fontScale),
            ),

            menuOpen ? SizedBox(height: 5 * fontScale,) : SizedBox(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 * fontScale),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AnimatedSize(
                  duration: animationDuration,
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.topCenter,
                  child: ClipRect(
                    child: menuOpen
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.all(15 * fontScale),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFF4EBDD).withValues(alpha: 0.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 4,
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              menuTabs.length,
                                  (index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: MenuItem(
                                  isActive: index == 0,
                                  title: menuTabs[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        : const SizedBox(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      tablet:  Container(
        padding: EdgeInsets.symmetric(vertical: 20 * scale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Expanded(
                  child: Text(
                    'Micah$screenWidth',
                    style: GoogleFonts.lobsterTwo(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),

            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  menuTabs.length,
                      (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 * scale),
                    child: MenuItem(
                      isActive: index == 0,
                      title: menuTabs[index],
                    ),
                  ),
                )

            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 4,
                                blurRadius: 8
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.phone,
                          color: Colors.teal.shade900,
                          size: 24 ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      tabletVertical: Container(
        padding: EdgeInsets.symmetric(vertical: 20 * scale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Expanded(
                child: Text(
                  'Micah',
                  style: GoogleFonts.lobsterTwo(
                      fontWeight: FontWeight.w500,
                      fontSize: 45,
                      color: Colors.black
                  ),
                ),
              ),
            ),

            SizedBox(width: 5 * scale,),

            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  menuTabs.length,
                      (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 * scale),
                    child: MenuItem(
                      isActive: index == 0,
                      title: menuTabs[index],
                    ),
                  ),
                )

            ),

            SizedBox(width: 20 * scale,),

            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              spreadRadius: 4,
                              blurRadius: 8
                          )
                        ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.phone,
                        color: Colors.teal.shade900,
                        size: 24 ,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
