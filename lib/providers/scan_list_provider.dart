import 'package:flutter/material.dart';
import 'db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String valor) async {
    // Create new instance of the ScanModel
    final newScan = ScanModel(tipo: selectedType, valor: valor);
    // Calls the newScan method of the DBProvider class to insert a new scan
    // into the database and assigns the returned ID to the id variable using async
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    //Add Scan to List<ScanModel> scans
    if (selectedType == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
  }
}
