import 'package:flutter/material.dart';
import 'package:micahs_portfolio/util/open_link.dart';
import 'package:simple_icons/simple_icons.dart';

import '../models/social_item.dart';

class SocialDock extends StatefulWidget {
  const SocialDock({super.key});

  @override
  State<SocialDock> createState() => _SocialDockState();
}

class _SocialDockState extends State<SocialDock> {
  final List<SocialItem> socials = [
    SocialItem(icon: SimpleIcons.github, url: 'https://github.com/MKM909'),
    SocialItem(icon: SimpleIcons.discord, url: 'https://discord.com/users/1088975589161050263'),
    SocialItem(icon: SimpleIcons.gmail, url: 'okohmicah00@gmail.com', isEmail: true),
    SocialItem(icon: SimpleIcons.whatsapp, url: 'https://wa.me/2349126433601'),
  ];

  double mouseX = -1;
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 44;
    const double overlap = 28;

    return MouseRegion(
      onHover: (event) {
        setState(() {
          hovering = true;
          mouseX = event.position.dx;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
          mouseX = -1;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          // Use fade + slide for smooth transition
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: SizedBox(
          height: iconSize,
          width: socials.length * overlap + iconSize,
          child: Stack(
            children: List.generate(socials.length, (index) {
              final iconCenterX = index * overlap + iconSize / 2;
              final distance = (mouseX - iconCenterX).abs();

              final scale = hovering
                  ? (1 - (distance / 180)).clamp(1.0, 1.4)
                  : 1.0;

              return Positioned(
                left: index * overlap,
                bottom: 0,
                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 120),
                  curve: Curves.easeOut,
                  child: _DockIcon(
                    icon: socials[index].icon,
                    color: Colors.teal.shade900,
                    url: socials[index].url,
                    isEmail: socials[index].isEmail,
                  ),
                ),
              );
            }),
          ),
        ),
      )
    );
  }
}

class _DockIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String url;
  final bool isEmail;

  const _DockIcon({
    required this.icon,
    required this.color,
    required this.url,
    this.isEmail = false,
  });

  @override
  State<_DockIcon> createState() => _DockIconState();
}

class _DockIconState extends State<_DockIcon> {
  bool hoveringIcon = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hoveringIcon = true),
      onExit: (_) => setState(() => hoveringIcon = false),
      child: AnimatedScale(
        scale: hoveringIcon ? 1.4 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              widget.isEmail
                  ? openEmailWeb(widget.url)
                  : openLink(widget.url);
            },
            child: SizedBox(
              width: 44,
              height: 44,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: widget.color, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(widget.icon, size: 20, color: widget.color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

