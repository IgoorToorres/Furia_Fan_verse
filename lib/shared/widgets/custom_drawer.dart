import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Image.asset('assets/logo-furia.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Boas Vindas Furioso!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.filter_alt,
                      color: AppColors.textColor,
                    ),
                    title: Text(
                      'Filtros',
                      style:
                          TextStyle(fontSize: 18, color: AppColors.textColor),
                    ),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.accessibility_outlined,
                      color: AppColors.textColor,
                    ),
                    title: Text(
                      'Ajuda',
                      style:
                          TextStyle(fontSize: 18, color: AppColors.textColor),
                    ),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: AppColors.textColor,
                    ),
                    title: Text(
                      'Minha conta',
                      style:
                          TextStyle(fontSize: 18, color: AppColors.textColor),
                    ),
                    onTap: () {
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
