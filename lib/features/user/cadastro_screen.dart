import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:fuira_fan_verse/core/models/providers/auth_provider.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final photoUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: AppColors.cardColor),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.cardColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: AppColors.cardColor),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.cardColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: AppColors.cardColor),
                        prefixIcon:
                            Icon(Icons.lock, color: AppColors.cardColor),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: photoUrlController,
                      decoration: const InputDecoration(
                        labelText: 'Foto (URL opcional)',
                        labelStyle: TextStyle(color: AppColors.cardColor),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.cardColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await authProvider.register(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            photoUrl: photoUrlController.text.isEmpty
                                ? null
                                : photoUrlController.text,
                          );
                          Navigator.pop(context); // Volta para a tela de login
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: AppColors.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: AppColors.textCardColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
