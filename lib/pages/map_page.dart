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
    const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
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
