import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ExploreSwipe extends StatefulWidget {
  const ExploreSwipe({super.key});

  @override
  State<ExploreSwipe> createState() => _ExploreSwipeState();
}

class _ExploreSwipeState extends State<ExploreSwipe> {
  @override
  Widget build(BuildContext context) {

    // Use existing asset filenames and protect against load errors
    List<String> cardPaths = [
      'assets/images/karhyl3.jpg',
      'assets/images/karhyl4.jpg',
      'assets/images/karhyl5.jpg',
    ];

    List<Widget> cards = cardPaths.map((path) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[300],
              child: const Center(child: Text('Image not found')),
            ),
          ),
        ),
      );
    }).toList();
    
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.all(5),
            child: CardSwiper(
              cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) => 
                cards[index],
              cardsCount: cards.length,
            ),
          ),
        ],
      ),
    );

  }
}