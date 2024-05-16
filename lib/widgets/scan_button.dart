import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          const barcodeScanRes = 'https://google.com';
          final ScanListProvider scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.newScan(barcodeScanRes);
        });
  }
}
