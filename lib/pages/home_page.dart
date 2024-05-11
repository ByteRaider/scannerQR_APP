import 'package:flutter/material.dart';
import 'package:qr_reader/pages/pages.dart';
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
        child: MapHistoryPage(),
      ),
      bottomNavigationBar: const CustomNavigatorbar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;
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
