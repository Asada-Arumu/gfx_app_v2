import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class KarhylGFX extends StatefulWidget {
  const KarhylGFX({super.key});

  @override
  State<KarhylGFX> createState() => _KarhylGFXState();
}

class _KarhylGFXState extends State<KarhylGFX> {

  final List<String> images = [
    'assets/images/karhyl0.png',
    'assets/images/karhyl1.jpg',
    'assets/images/karhyl2.jpg',

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