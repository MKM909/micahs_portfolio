import 'package:flutter/material.dart';
import 'sidebar_item.dart';

class VerticalSidebar extends StatefulWidget {
  const VerticalSidebar({super.key});

  @override
  State<VerticalSidebar> createState() => _VerticalSidebarState();
}

class _VerticalSidebarState extends State<VerticalSidebar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool value) {
    setState(() => isHovered = value);
    value ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0F0F0F),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.25),
                blurRadius: 25,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SidebarItem(
                icon: Icons.home_rounded,
                label: 'Home',
                controller: _controller,
              ),
              SidebarItem(
                icon: Icons.person_rounded,
                label: 'About',
                controller: _controller,
              ),
              SidebarItem(
                icon: Icons.work_rounded,
                label: 'Projects',
                controller: _controller,
              ),
              SidebarItem(
                icon: Icons.mail_rounded,
                label: 'Contact',
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}