import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final AnimationController controller;

  const SidebarItem({
    required this.icon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.orange, size: 22),

          const SizedBox(width: 12),

          /// Text reveal
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: controller.value,
              child: AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
