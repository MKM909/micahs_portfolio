import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micahs_portfolio/widgets/responsive_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Works extends StatefulWidget {
  const Works({super.key});

  @override
  State<Works> createState() => _WorksState();
}

class _WorksState extends State<Works> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scale = screenWidth / 1600;
    double scale2 = screenWidth / 800;
    return ResponsiveWidget(
      desktop: Container(
        color: Colors.white,
        height: 477,
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Projects Column
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProjectShowcase(
                    category: 'Website',
                    numberOfProjects: 1,
                    color: Colors.teal,
                    icon: 'assets/icons/desktop_windows.svg',
                  ),
                  SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Mobile App',
                    numberOfProjects: 6,
                    color: Colors.brown,
                    icon: 'assets/icons/mobile.svg',
                  ),
                  SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Personal Projects',
                    numberOfProjects: 4,
                    color: Colors.redAccent,
                    icon: 'assets/icons/person.svg',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 60),
            // Description Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What Do I.',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Text(
                      'I build innovative and user-friendly applications, specializing in mobile and web development. I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code.',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal.shade900,
                        height: 2.2
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10+',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 100,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Happy Clients',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      tablet: Container(
        color: Colors.white,
        height: 477,
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Projects Column
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProjectShowcase(
                    category: 'Website',
                    numberOfProjects: 1,
                    color: Colors.teal,
                    icon: 'assets/icons/desktop_windows.svg',
                  ),
                  SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Mobile App',
                    numberOfProjects: 6,
                    color: Colors.brown,
                    icon: 'assets/icons/mobile.svg',
                  ),
                  SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Personal Projects',
                    numberOfProjects: 4,
                    color: Colors.redAccent,
                    icon: 'assets/icons/person.svg',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 60),
            // Description Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What Do I.',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Text(
                      'I build innovative and user-friendly applications, specializing in mobile and web development. I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code.',
                      style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.teal.shade900,
                          height: 2.0
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10+',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 100,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Happy Clients',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      tabletVertical: screenWidth > 650
          ? Container(
        color: Colors.white,
        height: 415,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Projects Column
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProjectShowcase(
                    category: 'Website',
                    numberOfProjects: 1,
                    color: Colors.teal,
                    icon: 'assets/icons/desktop_windows.svg',
                    textDecrease: screenWidth < 701 ?  5 : 3,
                  ),
                  const SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Mobile App',
                    numberOfProjects: 6,
                    color: Colors.brown,
                    icon: 'assets/icons/mobile.svg',
                    textDecrease: screenWidth < 701 ?  5 : 3,
                  ),
                  const SizedBox(height: 20),
                  ProjectShowcase(
                    category: 'Personal Projects',
                    numberOfProjects: 4,
                    color: Colors.redAccent,
                    icon: 'assets/icons/person.svg',
                    textDecrease: screenWidth < 701 ?  5 : 3,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 60),
            // Description Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What Do I.',
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Text(
                      'I build innovative and user-friendly applications, specializing in mobile and web development. I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code.',
                      style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.teal.shade900,
                          height: 2.0
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10+',
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 12.5,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 65,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2',
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            'Happy Clients',
                            style: GoogleFonts.poppins(
                              fontSize: 12.5,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
          : Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Projects Column
            ProjectShowcase(
              category: 'Website',
              numberOfProjects: 1,
              color: Colors.teal,
              icon: 'assets/icons/desktop_windows.svg',
              textDecrease: 3,
            ),
            const SizedBox(height: 20),
            ProjectShowcase(
              category: 'Mobile App',
              numberOfProjects: 6,
              color: Colors.brown,
              icon: 'assets/icons/mobile.svg',
              textDecrease: 3,
            ),
            const SizedBox(height: 20),
            ProjectShowcase(
              category: 'Personal Projects',
              numberOfProjects: 4,
              color: Colors.redAccent,
              icon: 'assets/icons/person.svg',
              textDecrease: 3,
            ),
            const SizedBox(height: 30),
            // Description Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'What Do I.',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal.shade900,
                  ),
                ),
                const SizedBox(height: 10,),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    'I build innovative and user-friendly applications, specializing in mobile and web development. I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code.',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal.shade900,
                        height: 2.0
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10+',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        Text(
                          'Completed',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        Text(
                          'Happy Clients',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      mobile: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Description Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'What Do I.',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal.shade900,
                  ),
                ),
                const SizedBox(height: 10,),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    'I build innovative and user-friendly applications, specializing in mobile and web development. I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code.',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal.shade900,
                        height: 2.0
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10+',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        Text(
                          'Completed',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        Text(
                          'Happy Clients',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            // Projects Column
            ProjectShowcase(
              category: 'Website',
              numberOfProjects: 1,
              color: Colors.teal,
              icon: 'assets/icons/desktop_windows.svg',
              textDecrease: 3,
            ),
            const SizedBox(height: 20),
            ProjectShowcase(
              category: 'Mobile App',
              numberOfProjects: 6,
              color: Colors.brown,
              icon: 'assets/icons/mobile.svg',
              textDecrease: 3,
            ),
            const SizedBox(height: 20),
            ProjectShowcase(
              category: 'Personal Projects',
              numberOfProjects: 4,
              color: Colors.redAccent,
              icon: 'assets/icons/person.svg',
              textDecrease: 3,
            ),

          ],
        ),
      ),
    );
  }
}

// Description widget separated for reuse
class WhatIDoText extends StatelessWidget {
  const WhatIDoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'I build innovative and user-friendly applications, specializing in mobile and web development using Flutter, Android (Java/Kotlin). I create custom UI/UX components, smart notification systems, and interactive features, bringing ideas to life with clean, efficient code. I also have experience in game development, developing immersive 2D and 3D experiences.',
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.teal.shade900,
      ),
    );
  }
}

// Hoverable ProjectShowcase
class ProjectShowcase extends StatefulWidget {
  final String category;
  final int numberOfProjects;
  final Color color;
  final String icon;
  final double textDecrease;

  const ProjectShowcase({
    super.key,
    required this.category,
    required this.numberOfProjects,
    required this.color,
    required this.icon, this.textDecrease = 0,
  });

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovering ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade300,
            width: isHovering ? 1.5 : 1,
          ),
          boxShadow: isHovering
              ? [
            BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 20,
                offset: const Offset(0, 10)),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                widget.icon,
                width: 25 - widget.textDecrease,
                height: 25 - widget.textDecrease,
              ),
            ),
            SizedBox(width: 20 - (widget.textDecrease - 2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.category,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 20 - widget.textDecrease),
                ),
                Text(
                  '${widget.numberOfProjects} Projects',
                  style: GoogleFonts.poppins(fontSize: 15 - widget.textDecrease),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
