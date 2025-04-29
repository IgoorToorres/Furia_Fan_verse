import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/data/shop_data.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';
import 'package:fuira_fan_verse/shared/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final shopProvider = Provider.of<ShopData>(context, listen: false);
      await shopProvider.getShop();
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopData>(context);
    final blusas = shopProvider.getByType("blusa");

    return Scaffold(
      appBar: AppbarDefault(),
      drawer: CustomDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
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
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://furiagg.fbitsstatic.net/img/b/1be4afd5-a727-4555-81fd-e779a32578be.jpg?w=1366&v=no-change',
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      blusas.length,
                      (index) => Text(
                        blusas[index].title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
