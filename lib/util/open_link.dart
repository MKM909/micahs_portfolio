import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

/// Opens any URL
Future<void> openLink(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
  )) {
    throw 'Could not launch $url';
  }
}

/// Opens email on mobile
Future<void> openEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=Hello Micah&body=I saw your portfolio',
  );

  if (!await launchUrl(emailUri)) {
    throw 'Could not open email app';
  }
}

/// Opens Gmail on web
Future<void> openEmailWeb(String email) async {
  final uri = Uri.parse(
    'https://mail.google.com/mail/?view=cm&fs=1'
        '&to=$email'
        '&su=Hello Micah'
        '&body=I saw your portfolio',
  );

  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    debugPrint('Could not open Gmail');
  }
}

/// Opens call or WhatsApp depending on platform
Future<void> openCallOrWhatsapp(String phoneNumber) async {
  final telUrl = Uri.parse('tel:$phoneNumber');
  final whatsappUrl = Uri.parse('https://wa.me/${phoneNumber.replaceAll("+", "")}');

  try {
    if (kIsWeb) {
      // Web → WhatsApp
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else if (Platform.isAndroid || Platform.isIOS) {
      // Mobile → Dialer
      await launchUrl(telUrl);
    } else {
      // Desktop → WhatsApp Web
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    debugPrint('Could not launch: $e');
  }
}
