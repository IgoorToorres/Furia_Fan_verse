import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';
import 'package:fuira_fan_verse/shared/widgets/custom_drawer.dart';

class StoreScrenn extends StatelessWidget {
  const StoreScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Image.asset(
                      'assets/furia-coin.png',
                      height: 40,
                    ),
                    Text('250'),
                    Text('Coins'),
                  ],
                ),
                Text('Extrato'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://furiagg.fbitsstatic.net/img/b/1be4afd5-a727-4555-81fd-e779a32578be.jpg?w=1366&v=no-change',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
