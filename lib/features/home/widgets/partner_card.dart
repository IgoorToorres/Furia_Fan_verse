import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final String image;
  const PartnerCard({super.key, required this.image});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Container(
        width: 320,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/icone-furia.png',
            image: image,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            placeholderFit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
