import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class MapPage extends StatelessWidget {
  final String text = "Map Page";
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor.toString()),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () =>
            Navigator.pushNamed(context, 'map', arguments: 'ID:$index'),
      ),
    );
  }
}
