import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final String image;
  const PartnerCard({super.key, required this.image});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 350,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/icone-furia.png',
            image: image,
      
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
