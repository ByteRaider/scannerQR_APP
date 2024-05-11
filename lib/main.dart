import 'package:flutter/material.dart';
import 'package:qr_reader/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'QR Reader', initialRoute: 'home', routes: {
      '/': (_) => const HomePage(),
      'map': (_) => const MapPage(),
    });
  }
}
