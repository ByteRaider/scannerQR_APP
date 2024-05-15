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

  loadScans() async {
    // Get all scans
    final scans = await DBProvider.db.getScansAll();
    // Set List<ScanModel> scans = to final scans list with spread operator
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    ''' create a new list scans with the same elements as the scans list obtained from
        the database and assigns it to the scans property of the current object.
    ''';
    // Set List<ScanModel> scans = to final scans list with spread operator
    this.scans = [...scans];
    selectedType = tipo;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(selectedType);
    //notifyListeners(); is loaded by loadScansByType
  }
}
