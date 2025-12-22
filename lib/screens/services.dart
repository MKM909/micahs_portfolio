import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micahs_portfolio/screens/works.dart';
import 'package:micahs_portfolio/util/key_strings.dart';
import 'package:micahs_portfolio/widgets/animation_widgets/fade_from_bottom.dart';
import 'package:micahs_portfolio/widgets/animation_widgets/fade_from_left.dart';
import 'package:micahs_portfolio/widgets/animation_widgets/fade_from_right.dart';
import 'package:micahs_portfolio/widgets/animation_widgets/pop_bounce.dart';
import 'package:micahs_portfolio/widgets/social_dock.dart';

import '../../widgets/responsive_widget.dart';
import '../../widgets/typewriter_text.dart';
import '../notifier/width_notifier.dart';
import '../util/open_link.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> with TickerProviderStateMixin{
  late AnimationController animationController;

  bool startTyping = false;
  Duration animationDuration = const Duration(milliseconds: 800);

  late WidthNotifier widthNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration + Duration(milliseconds: 100),
    );

    widthNotifier = WidthNotifier(animationController: animationController);

    animationController.addListener(() {
      if (animationController.isCompleted) {
        setState(() => startTyping = true);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
    widthNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double scale = MediaQuery.of(context).size.width / 1600;
    double screenWidth = MediaQuery.of(context).size.width;

    widthNotifier.checkWidth(screenWidth, () {
      setState(() {
        startTyping = true;
      });
    });


    double appBarHeight =  100;
    double bodyPadding = 50;

    if (screenWidth <= 550) {
      appBarHeight = 85;
      bodyPadding = 30;
    } else if (screenWidth <= 850) {
      appBarHeight = 85;
      bodyPadding = 40;
    } else if (screenWidth <= 1000) {
      appBarHeight = 100;
      bodyPadding = 50;
    }

    return ResponsiveWidget(
      // Desktop Service
      desktop: Column(
        children: [
          SizedBox(height: appBarHeight,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding),
            height: 600 * scale,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PopBounce(
                    duration: animationDuration,
                    child: Center(
                      child: Image.asset(
                        key: const ValueKey(KeyStrings.waterColor),
                        'assets/images/water_color.png',
                        height: 600 * scale,
                        width: 650 * scale,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: FadeFromBottom(
                    duration: animationDuration,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: Image.asset(
                          key: const ValueKey(KeyStrings.micahStandalone),
                          'assets/images/micah_standalone.png',
                          height: 550 * scale,
                          width: 500 * scale,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10 * scale),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: FadeFromLeft(
                            duration: animationDuration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TOP
                                HackerTypewriterText(
                                  key: const ValueKey(KeyStrings.headerText),
                                  text: "Hey There,\nI'm Micah",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 55,
                                    color: Colors.teal.shade900,
                                  ),
                                  textAlign: TextAlign.start,
                                  startTyping: startTyping,
                                ),

                                /// MIDDLE
                                InkWell(
                                  onTap: () => openEmailWeb("okohmicah00@gmail.com"),
                                  child: Text(
                                    "okohmicah00@gmail.com",
                                    key: const ValueKey(KeyStrings.emailText),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.red.shade900,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.red.shade900,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),

                                /// BOTTOM
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '5',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 60,
                                        color: Colors.teal.shade900,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "YEARS",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.teal.shade900,
                                          ),
                                        ),
                                        Text(
                                          "EXPERIENCE",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.teal.shade900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: FadeFromRight(
                            duration: animationDuration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  key: const ValueKey(KeyStrings.descriptionText),
                                  "I'm a Flutter Developer.\n"
                                      "I build beautiful and functional apps.\n"
                                      "I'm always looking for new challenges \nand opportunities to learn and grow.\n"
                                      "Let's work together to create \nsomething amazing.",
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.teal.shade900,
                                  ),
                                ),

                                SocialDock(
                                  key: const ValueKey(KeyStrings.socialDock),
                                ),

                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Material(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withValues(alpha: 0.8),
                                                        spreadRadius: 10,
                                                        blurRadius: 15
                                                    )
                                                  ]
                                              ),
                                              child: Image.asset(
                                                key: const ValueKey(KeyStrings.companyLogo),
                                                'assets/images/company_logo.jpg',
                                                width: 150 * scale,
                                                height: 75 * scale,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 20 * scale),
                                      Text(
                                        "FOUNDER OF\n MICKO APPSERVICES",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                      SizedBox(height: 20 * scale),
                                    ]
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Works(),
        ],
      ),

      // Tablet Service
      tablet: Column(
        children: [
          SizedBox(height: appBarHeight,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding),
            height: 700 * scale,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PopBounce(
                    duration: animationDuration,
                    child: Center(
                      child: Image.asset(
                        key: const ValueKey(KeyStrings.waterColor),
                        'assets/images/water_color.png',
                        height: 600 * scale,
                        width: 650 * scale,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: FadeFromBottom(
                    duration: animationDuration,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: Image.asset(
                          key: const ValueKey(KeyStrings.micahStandalone),
                          'assets/images/micah_standalone.png',
                          height: 500 * scale,
                          width: 500 * scale,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10 * scale),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: FadeFromLeft(
                            duration: animationDuration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TOP
                                HackerTypewriterText(
                                  key: const ValueKey(KeyStrings.headerText),
                                  text: "Hey There,\nI'm Micah",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 45,
                                    color: Colors.teal.shade900,
                                  ),
                                  textAlign: TextAlign.start,
                                  startTyping: startTyping,
                                ),

                                /// MIDDLE
                                InkWell(
                                  onTap: () => openEmailWeb("okohmicah00@gmail.com"),
                                  child: Text(
                                    "okohmicah00@gmail.com",
                                    key: const ValueKey(KeyStrings.emailText),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.red.shade900,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.red.shade900,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),

                                /// BOTTOM
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '5',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 50,
                                        color: Colors.teal.shade900,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "YEARS",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.teal.shade900,
                                          ),
                                        ),
                                        Text(
                                          "EXPERIENCE",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.teal.shade900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: FadeFromRight(
                            duration: animationDuration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  key: const ValueKey(KeyStrings.descriptionText),
                                  "I'm a Flutter Developer. I build beautiful and functional apps. "
                                      "I'm always looking for new challenges and opportunities to learn and grow."
                                      "Let's work together to create something amazing.",
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.teal.shade900,
                                  ),
                                ),

                                SocialDock(
                                  key: const ValueKey(KeyStrings.socialDock),
                                ),

                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Material(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withValues(alpha: 0.8),
                                                        spreadRadius: 10,
                                                        blurRadius: 15
                                                    )
                                                  ]
                                              ),
                                              child: Image.asset(
                                                key: const ValueKey(KeyStrings.companyLogo),
                                                'assets/images/company_logo.jpg',
                                                width: 200 * scale,
                                                height: 100 * scale,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 20 * scale),
                                      Text(
                                        "FOUNDER OF\n MICKO APPSERVICES",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                      SizedBox(height: 20 * scale),
                                    ]
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Works()
        ],
      ),

      //Tablet Vertical
      tabletVertical:  Column(
        children: [
          SizedBox(height: appBarHeight,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding),
            height: 1350 * scale,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: PopBounce(
                    duration: animationDuration,
                    child: Center(
                      child: Image.asset(
                        key: const ValueKey(KeyStrings.waterColor),
                        'assets/images/water_color.png',
                        height: 900 * scale,
                        width: 950 * scale,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: FadeFromBottom(
                    duration: animationDuration,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: Image.asset(
                          key: const ValueKey(KeyStrings.micahStandalone),
                          'assets/images/micah_standalone.png',
                          height: 900 * scale,
                          width: 850 * scale,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10 * scale),
                    child: FadeFromLeft(
                      duration: animationDuration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// TOP
                          HackerTypewriterText(
                            key: const ValueKey(KeyStrings.headerText),
                            text: "Hey There, I'm Micah",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 50,
                              color: Colors.teal.shade900,
                            ),
                            textAlign: TextAlign.start,
                            startTyping: startTyping,
                          ),

                          SizedBox(height: 5),

                          Text(
                            key: const ValueKey(KeyStrings.descriptionText),
                            screenWidth > 620 ? "I'm a Flutter Developer. I build beautiful and functional apps. "
                                "I'm always looking for new challenges and opportunities to learn and grow."
                                "Let's work together to create something amazing. ${MediaQuery.of(context).size.width}"
                                : "I'm a Flutter Developer. I build beautiful and functional apps. \n"
                                "I'm always looking for new challenges and \nopportunities to learn and grow. \n"
                                "Let's work together to create something \namazing.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.teal.shade900,
                            ),
                          ),


                          SizedBox(height: 10),

                          SocialDock(
                            key: const ValueKey(KeyStrings.socialDock),
                          ),

                          Expanded(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => openEmailWeb("okohmicah00@gmail.com"),
                                    child: Text(
                                      key: const ValueKey(KeyStrings.emailText),
                                      "okohmicah00@gmail.com",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.red.shade900,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.red.shade900,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),


                                  SizedBox(height: 10),

                                  /// BOTTOM
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '5',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 50,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "YEARS",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.teal.shade900,
                                            ),
                                          ),
                                          Text(
                                            "EXPERIENCE",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.teal.shade900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Material(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black.withValues(alpha: 0.8),
                                                          spreadRadius: 10,
                                                          blurRadius: 15
                                                      )
                                                    ]
                                                ),
                                                child: Image.asset(
                                                  key: const ValueKey(KeyStrings.companyLogo),
                                                  'assets/images/company_logo.jpg',
                                                  width: 200 * scale,
                                                  height: 100 * scale,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        SizedBox(height: 20 * scale),
                                        Text(
                                          "FOUNDER OF\nMICKO APPSERVICES",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.teal.shade900,
                                          ),
                                        ),
                                        SizedBox(height: 20 * scale),
                                      ]
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Works()
        ],
      ),

      // Mobile Service
      mobile: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: bodyPadding),
            child: Column(
              children: [
                SizedBox(height: appBarHeight,),
                FadeFromLeft(
                  duration: animationDuration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      /// TOP
                      HackerTypewriterText(
                        key: const ValueKey(KeyStrings.headerText),
                        text: "Hey There, \nI'm Micah",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 45,
                          color: Colors.teal.shade900,
                        ),
                        textAlign: TextAlign.start,
                        startTyping: startTyping,
                      ),

                      SizedBox(height: 8),

                      Text(
                        key: const ValueKey(KeyStrings.descriptionText),
                        "I'm a Flutter Developer. I build beautiful and functional apps. "
                            "I'm always looking for new challenges and opportunities to learn and grow."
                            "Let's work together to create something amazing.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 2.0,
                          color: Colors.teal.shade900,
                        ),
                      ),


                      SizedBox(height: 10),

                      SocialDock(
                        key: const ValueKey(KeyStrings.socialDock),
                      ),

                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 1000 * scale,
                    width: 950 * scale,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Center(
                            child: PopBounce(
                              duration: animationDuration,
                              child: Center(
                                child: Image.asset(
                                  key: const ValueKey(KeyStrings.waterColor),
                                  'assets/images/water_color.png',
                                  height: 1000 * scale,
                                  width: 950 * scale,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: FadeFromBottom(
                            duration: animationDuration,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Center(
                                child: Image.asset(
                                  key: const ValueKey(KeyStrings.micahStandalone),
                                  'assets/images/micah_standalone.png',
                                  height: 1000 * scale,
                                  width: 950 * scale,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Works()
        ],
      ),
    );
  }
}
