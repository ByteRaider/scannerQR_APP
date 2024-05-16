import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: const Text('Address: '),
        subtitle: Text('ID:$index'),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () =>
            Navigator.pushNamed(context, 'map', arguments: 'ID:$index'),
      ),
    );
  }
}
