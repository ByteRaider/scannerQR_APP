import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapPage extends StatelessWidget {
  final String text = "Map Page";
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Location - ${scan.valor}'),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
