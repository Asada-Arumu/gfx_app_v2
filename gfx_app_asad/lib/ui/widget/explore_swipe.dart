import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExploreSwipe extends StatefulWidget {
  const ExploreSwipe({super.key});

  @override
  State<ExploreSwipe> createState() => _ExploreSwipeState();
}

class _ExploreSwipeState extends State<ExploreSwipe> {
  final supabase = Supabase.instance.client;

  Future<List<String>> _futureImages = Future.value([]);

  @override
  void initState() {
    super.initState();
    _futureImages = fetchKarhylImages();
  }

  Future<List<String>> fetchKarhylImages() async {
    final response = await supabase
        .from('images')
        .select('url')
        .eq('creator_name', 'Karhyl')
        .order('created_at', ascending: false);

    return response
        .map<String>((item) => item['url'] as String)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _futureImages,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 350,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 350,
            child: Center(child: Text('No images from Karhyl')),
          );
        }

        final images = snapshot.data!;

  List<Widget> cards = images.map((url) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          url,
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
      },
    );
  }
}
