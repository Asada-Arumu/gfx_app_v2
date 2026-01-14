import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrizeroGFX extends StatefulWidget {
  const TrizeroGFX({super.key});

  @override
  State<TrizeroGFX> createState() => _TrizeroGFXState();
}

class _TrizeroGFXState extends State<TrizeroGFX> {

  final List<String> images = [
    'assets/images/trizero0.webp',
    'assets/images/trizero1.webp',
    'assets/images/trizero2.webp',
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
            height: 380,
          ),
        ),

      ]

    );
  }
}