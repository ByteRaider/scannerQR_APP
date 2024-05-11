import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapPage extends StatelessWidget {
  final String text = "Map Page";
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
