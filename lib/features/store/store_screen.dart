import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/data/shop_data.dart';
import 'package:fuira_fan_verse/features/store/widgets/shop_filter_carousel.dart';
import 'package:fuira_fan_verse/features/store/widgets/store_banner.dart';
import 'package:fuira_fan_verse/features/store/widgets/store_header.dart';
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

    return Scaffold(
      appBar: AppbarDefault(),
      drawer: CustomDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const StoreHeader(),
                  const Divider(),
                  const StoreBanner(),
                  ShopFilterCarousel(
                    title: 'Blusas',
                    items: shopProvider.getByType("blusa"),
                  ),
                  ShopFilterCarousel(
                    title: 'Casacos',
                    items: shopProvider.getByType("casaco"),
                  ),
                  ShopFilterCarousel(
                    title: 'periféricos',
                    items: shopProvider.getByType("periferico"),
                  ),
                  ShopFilterCarousel(
                    title: 'Autografos',
                    items: shopProvider.getByType("assinatura"),
                  ),
                ],
              ),
            ),
    );
  }
}
