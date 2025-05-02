import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';
import 'package:provider/provider.dart';
import 'package:fuira_fan_verse/core/models/providers/auth_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppbarDefault(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: user?.photoURL != null
                              ? NetworkImage(user!.photoURL!)
                              : const AssetImage('assets/avatar-default.png')
                                  as ImageProvider,
                          radius: 50,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          user?.displayName ?? 'Sem nome',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user?.email ?? 'Sem email',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: AppColors.textCardColor),
                  label: const Text('Editar dados'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.cardColor,
                    foregroundColor: AppColors.textCardColor,
                    elevation: 2,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () => authProvider.logout(),
                  icon: const Icon(Icons.logout),
                  label: const Text('Sair da conta'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
