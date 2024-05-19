import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          const barcodeScanRes = 'geo:33.123222, 103.350553';
          if (barcodeScanRes == '-1') {
            return;
          }
          final ScanListProvider scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.newScan(barcodeScanRes);
          // scanListProvider.newScan('geo:40.750000, -74.000000');
          // scanListProvider.newScan('http://www.gmail.com');
          // scanListProvider.newScan('geo:49.750420, -74.000090');
          final scan = await scanListProvider.newScan(barcodeScanRes);
          launchURL(context, scan);
        });
  }
}
