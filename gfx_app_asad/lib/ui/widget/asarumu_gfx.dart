import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class AsarumuGFX extends StatefulWidget {
  const AsarumuGFX({super.key});

  @override
  State<AsarumuGFX> createState() => _AsarumuGFXState();
} 

class _AsarumuGFXState extends State<AsarumuGFX> {

  final List<String> images = [
    'assets/images/Gfx Bocchi.png',
    'assets/images/Gfx Heizou.png',
    'assets/images/Arcunime PP 2.png',
  ];

  ImageProvider getImageProvider(String imagePath) {
      return AssetImage(imagePath);
  }


  @override
  Widget build(BuildContext context) {
  return Column(
      children: [        

        CarouselSlider(
          items: images.map((item) => Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: getImageProvider(item),
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            height: 300,
          ),
        ),

      ]

    );

  }
}