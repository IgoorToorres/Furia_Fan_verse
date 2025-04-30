import 'dart:async';
import 'package:flutter/material.dart';

class StoreBanner extends StatefulWidget {
  const StoreBanner({super.key});

  @override
  State<StoreBanner> createState() => _StoreBannerState();
}

class _StoreBannerState extends State<StoreBanner> {
  final List<String> banners = const [
    'https://furiagg.fbitsstatic.net/img/b/1be4afd5-a727-4555-81fd-e779a32578be.jpg?w=1366&v=no-change',
    'https://furiagg.fbitsstatic.net/img/b/48f96157-1822-4460-b9dd-959cf375256c.jpg?w=1366&v=no-change',
    'https://i0.wp.com/nosnerds.com.br/wp-content/uploads/2019/07/hyperxfuria-capa.jpg?fit=870%2C450&ssl=1',
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % banners.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return Image.network(
                banners[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
      ),
    );
  }
}
