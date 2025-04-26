import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';

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
      backgroundColor: AppColors.brackgroundColor,
      selectedItemColor: AppColors.cardColor,
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
