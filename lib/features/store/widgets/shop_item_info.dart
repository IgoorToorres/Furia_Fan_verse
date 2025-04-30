import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/models/shop.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';

class ShopItemInfo extends StatefulWidget {
  final Shop shop;
  const ShopItemInfo({super.key, required this.shop});

  @override
  State<ShopItemInfo> createState() => _ShopItemInfoState();
}

class _ShopItemInfoState extends State<ShopItemInfo> {
  String selectedSize = 'P';
  bool personalize = false;

  final sizes = ['PP', 'P', 'M', 'G', 'GG', '3G'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(),
      backgroundColor: AppColors.backgroundLight,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // ação de compra
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'TROCAR POR ${widget.shop.value} COINS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textCardColor),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.shop.imageUrl,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  widget.shop.imageUrl,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shop.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tamanho',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: sizes.map((size) {
                      final isSelected = size == selectedSize;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: personalize,
                        onChanged: (value) {
                          setState(() => personalize = value ?? false);
                        },
                      ),
                      const Text('Personalize'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () {
                      // abrir guia de tamanhos
                    },
                    icon: const Icon(Icons.straighten),
                    label: const Text('Guia de tamanhos'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.shop.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
