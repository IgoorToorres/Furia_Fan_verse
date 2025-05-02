import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/features/user/user_screen.dart';
import 'package:provider/provider.dart';
import 'package:fuira_fan_verse/core/models/providers/auth_provider.dart';
import 'login_screen.dart';

class UserOrLoginScreen extends StatelessWidget {
  const UserOrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoggedIn) {
      return const UserScreen();
    } else {
      return const LoginScreen(); // Login leva a Cadastro se necessário
    }
  }
}
