import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrizeroGFX extends StatefulWidget {
  const TrizeroGFX({super.key});

  @override
  State<TrizeroGFX> createState() => _TrizeroGFXState();
}

class _TrizeroGFXState extends State<TrizeroGFX> {
  final supabase = Supabase.instance.client;
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = fetchTrizeroImages();
  }

  Future<List<String>> fetchTrizeroImages() async {
    final response = await supabase
        .from('images')
        .select('url')
        .eq('creator_name', 'Trizero')
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
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(child: Text('No images from Trizero')),
          );
        }

        final images = snapshot.data!;

        return CarouselSlider(
          items: images.map((url) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
          ),
        );
      },
    );
  }
}
