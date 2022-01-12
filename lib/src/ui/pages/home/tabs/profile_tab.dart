import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://image.freepik.com/fotos-gratis/tortilha-com-falafel-e-salada-fresca-tacos-veganos-comida-vegetariana-saudavel_2829-14393.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
