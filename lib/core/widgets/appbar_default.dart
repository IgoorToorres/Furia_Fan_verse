import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/widgets/app_colors.dart';

class AppbarDefault extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/logo-furia.png'),
      backgroundColor: AppColors.whiteBackgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
