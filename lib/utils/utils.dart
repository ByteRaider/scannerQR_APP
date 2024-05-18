import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final Uri url = Uri(
    scheme: 'http',
    host: 'dart.dev',
    path: '/guides/libraries/library-tour',
  );

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(url)) {
      print('LAUNCHING URL: $url');
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'Something went wrong while launching URL: $url';
    }
  } else {
    print('Scan tipo es: ${scan.tipo}');
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
