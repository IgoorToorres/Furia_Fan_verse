import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';

class AppbarDefault extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/logo-furia.png'),
      backgroundColor: AppColors.brackgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
