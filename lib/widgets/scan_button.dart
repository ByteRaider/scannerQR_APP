import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', false, ScanMode.QR);
        print(barcodeScanRes);
        if (barcodeScanRes == '-1') {
          return;
        }
        // Navigator.pushNamed(context, 'map', arguments: barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
