import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:micahs_portfolio/screens/services.dart';

import '../widgets/responsive_widget.dart';
import '../widgets/tab_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
        desktop: Scaffold(
          backgroundColor: Color(0xFFF4EBDD),
          body: Stack(
            children: [

              Positioned.fill(
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Services(),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomTabBar(),
              ),

            ],
          ),
        ),
        mobile: Scaffold(
          backgroundColor: Color(0xFFF4EBDD),
          body: Stack(
            children: [

              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                    child: Services()
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomTabBar(),
              ),
            ],
          ),
        ),
        tablet: Scaffold(
          backgroundColor: Color(0xFFF4EBDD),
          body: Stack(
            children: [

              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Services(),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomTabBar(),
              ),

            ],
          ),
        ),
        tabletVertical: Scaffold(
          backgroundColor: Color(0xFFF4EBDD),
          body: Stack(
            children: [

              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Services(),),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomTabBar(),
              ),
            ],
          ),
        ),
    );
  }
}
