import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScan(int.parse(scans[index].id.toString()));
        },
        child: ListTile(
          leading: Icon(
              // scans[index].tipo == 'http'
              scans[index].tipo == 'http'
                  ? Icons.open_in_browser_rounded
                  : Icons.map_outlined,
              color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor.toString()),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () =>
              Navigator.pushNamed(context, 'map', arguments: 'ID:$index'),
        ),
      ),
    );
  }
}
