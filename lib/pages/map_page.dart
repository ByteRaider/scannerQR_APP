import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final String text = "Map Page";
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    final CameraPosition initialCameraPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.0,
      tilt: 59.440717,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Map Location - ${scan.valor}'),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
