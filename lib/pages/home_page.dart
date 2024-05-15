import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/db_provider.dart';
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
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {},
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
    //final tempScan = ScanModel(tipo: 'http', valor: 'https://google.com');
    //DBProvider.db.newScan(tempScan);
    //DBProvider.db.getScanById(5).then((scan) => print(scan?.valor));
    //DBProvider.db.getScansAll().then((scans) => print(scans.toString()));
    //DBProvider.db.getScansByType('http').then((scans) => print(scans.toString()));
    //DBProvider.db.updateScan(tempScan);
    //DBProvider.db.deleteScan(5);
    DBProvider.db.deleteAllScans().then((scans) => print(scans.toString()));

    switch (currentIndex) {
      case 0:
        return const MapPage();
      case 1:
        return const AddressesPage();

      default:
        return const MapHistoryPage();
    }
  }
}
