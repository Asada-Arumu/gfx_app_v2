import 'package:flutter/material.dart';
import '../widget/explore_swipe.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  static const List<String> _galleryImages = [
    'assets/images/Gfx Bocchi.png',
    'assets/images/Gfx Heizou.png',
    'assets/images/karhyl5.jpg',
    'assets/images/trizero0.webp',
    'assets/images/karhyl2.jpg',
    'assets/images/trizero2.webp',
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: const Color(0xFF67C090),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Explore',
                      style: TextStyle(
                          color: const Color(0xFFF7F7F7),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.account_circle_outlined, color: const Color(0xFFF7F7F7), size: 35),
                ],
              ),
            ),

            const ExploreSwipe(),

            Container(
              height: 20,
              margin: const EdgeInsets.only(top: 10),
              child: Center(
              child: Text(
                'Pinterest: Karhylselft',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            )
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 10),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),

                    itemCount: _galleryImages.length,

                    itemBuilder: (context, index) {
                      final path = _galleryImages[index];

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          path,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[300],
                            child: const Center(child: Text('No Image')),
                          ),
                        ),
                      );

                    },

                  ),
                ],
              ),
            ),
            
          ]
        ),
      ),
      );
  }
}