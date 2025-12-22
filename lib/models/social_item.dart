import 'package:flutter/material.dart';

class SocialItem {
  final IconData icon;
  final String url;
  final bool isEmail;

  SocialItem({required this.icon,required this.url, this.isEmail = false});
}
