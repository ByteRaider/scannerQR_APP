import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final String text = 'Home Page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(text),
        actions: [
          IconButton(
            tooltip: 'Delete all scans',
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAllScans();
            },
          )
        ],
      ),
      body: const Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: const CustomNavigatorbar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final UiProvider uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    // TEMP dev database:
    //final tempScan = ScanModel(tipo: 'http', valor: 'https://zoom.com');
    //DBProvider.db.newScan(tempScan);
    //DBProvider.db.getScanById(5).then((scan) => print(scan?.valor));
    //DBProvider.db.getScansAll().then((scans) => print(scans.toString()));
    //DBProvider.db.getScansByType('http').then((scans) => print(scans.toString()));
    //DBProvider.db.updateScan(tempScan);
    //DBProvider.db.deleteScan(5);
    //DBProvider.db.deleteAllScans().then((scans) => print(scans.toString()));

    //Use ScanPlaylistProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapHistoryPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return const AddressesPage();

      default:
        return const HomePage();
    }
  }
}
