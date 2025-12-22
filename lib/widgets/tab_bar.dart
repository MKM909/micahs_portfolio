import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micahs_portfolio/widgets/responsive_widget.dart';
import 'package:micahs_portfolio/widgets/typewriter_text.dart';

import '../util/key_strings.dart';
import '../util/open_link.dart';
import 'menu_item.dart';

class CustomTabBar extends StatefulWidget {

  const CustomTabBar({super.key,});

  @override
  State<CustomTabBar> createState() => _TabBarState();
}

class _TabBarState extends State<CustomTabBar> with TickerProviderStateMixin{

  List<String> menuTabs = ['Services', 'Work', 'Notes', 'Experience'];

  bool menuOpen = false;
  late AnimationController menuAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


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
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 350;
    double scale = MediaQuery.of(context).size.width / 1600;

    double bodyPadding = 50;

    if (screenWidth <= 550) {
      bodyPadding = 30;
    } else if (screenWidth <= 850) {
      bodyPadding = 40;
    } else if (screenWidth <= 1000) {
      bodyPadding = 50;
    }

    return ResponsiveWidget(
      desktop: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Color(0xFFF4EBDD).withValues(alpha: 0.5),
            padding: EdgeInsets.symmetric(horizontal: bodyPadding, vertical: 5 * scale),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Expanded(
                    child: Text(
                      key: const ValueKey(KeyStrings.micahLogo),
                      textAlign: TextAlign.left,
                      'Micah',
                      style: GoogleFonts.lobsterTwo(
                          fontWeight: FontWeight.w500,
                          fontSize: 45,
                          color: Colors.black
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
                        InkWell(
                          key: const ValueKey(KeyStrings.phoneNumberText),
                          onTap: () => openCallOrWhatsapp('+2349126433601'),
                          splashColor: Colors.teal.shade900.withValues(alpha: 0.1),
                          child: Text(
                            '+234 912 6433 601',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              onTap: () => openCallOrWhatsapp('+2349126433601'),
                              splashColor: Colors.teal.shade900.withValues(alpha: 0.1),
                              child: Container(
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
                  padding: EdgeInsets.symmetric(vertical: 10 * fontScale , horizontal: 20 * fontScale),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          key: const ValueKey(KeyStrings.micahLogo),
                          'Micah',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lobsterTwo(
                              fontWeight: FontWeight.w200,
                              fontSize: 30 * fontScale,
                              color: Colors.black
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
                                    padding: EdgeInsets.all(10 * fontScale),
                                    child: AnimatedIcon(
                                      icon: AnimatedIcons.menu_close,
                                      color: Colors.teal.shade900,
                                      size: 20 * fontScale,
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
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.topCenter,
                  child: ClipRect(
                    child: menuOpen
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20 * fontScale, horizontal: 30 * fontScale),
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
      tablet:  ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding, vertical: 5 * scale),
            color: Color(0xFFF4EBDD).withValues(alpha: 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Text(
                    key: const ValueKey(KeyStrings.micahLogo),
                    'Micah',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lobsterTwo(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        color: Colors.black
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              onTap: () => openCallOrWhatsapp('+2349126433601'),
                              splashColor: Colors.teal.shade900.withValues(alpha: 0.1),
                              child: Container(
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
        ),
      ),
      tabletVertical: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding, vertical: 5 * scale),
            color: Color(0xFFF4EBDD).withValues(alpha: 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Text(
                    key: const ValueKey(KeyStrings.micahLogo),
                    'Micah',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lobsterTwo(
                        fontWeight: FontWeight.w500,
                        fontSize: 42,
                        color: Colors.black
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () => openCallOrWhatsapp('+2349126433601'),
                            splashColor: Colors.teal.shade900.withValues(alpha: 0.1),
                            child: Container(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
