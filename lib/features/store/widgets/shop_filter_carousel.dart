import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/models/shop.dart';
import 'package:fuira_fan_verse/features/store/widgets/shop_card.dart';

class ShopFilterCarousel extends StatelessWidget {
  final String title;
  final List<Shop> items;

  const ShopFilterCarousel({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: List.generate(
              items.length,
              (index) => ShopCard(shop: items[index]),
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
