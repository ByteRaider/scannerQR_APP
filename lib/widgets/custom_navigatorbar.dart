import 'package:flutter/material.dart';

class CustomNavigatorbar extends StatelessWidget {
  const CustomNavigatorbar({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = 0;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Compass')
      ],
    );
  }
}
