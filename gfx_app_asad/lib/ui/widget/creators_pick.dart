import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CreatorsPick extends StatefulWidget {
  const CreatorsPick({super.key});

  @override
  State<CreatorsPick> createState() => _CreatorsPickState();
}

class _CreatorsPickState extends State<CreatorsPick> {

  final List<String> images = [
    'assets/images/karhyl0.png',
    'assets/images/Gfx Heizou.png',
    'assets/images/Gfx Bocchi.png',    
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