import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  // Parse from String to Uri object in order to launch the URL
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    // Checks whether the specified URL can be handled by some app installed on the device.
    if (await canLaunchUrl(url)) {
      // Opens the URL in the system's default browser.
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'Something went wrong while launching URL: $url';
    }
  } else {
    // Maps
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
