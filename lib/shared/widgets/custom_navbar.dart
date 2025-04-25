import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'Fanverse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_tv_outlined),
          label: 'Ao vivo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_sharp),
          label: 'Loja',
        ),
      ],
    );
  }
}
