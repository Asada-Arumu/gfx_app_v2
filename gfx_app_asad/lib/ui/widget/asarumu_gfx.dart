import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AsarumuGFX extends StatefulWidget {
  const AsarumuGFX({super.key});

  @override
  State<AsarumuGFX> createState() => _AsarumuGFXState();
}

class _AsarumuGFXState extends State<AsarumuGFX> {
  final supabase = Supabase.instance.client;
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = fetchAsarumuImages();
  }

  Future<List<String>> fetchAsarumuImages() async {
    final response = await supabase
        .from('images')
        .select('url')
        .eq('creator_name', 'Asarumu')
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
            child: Center(child: Text('No images from Asarumu')),
          );
        }

        final images = snapshot.data!;

        return CarouselSlider(
          items: images.map((url) {
            return Container(
              margin: const EdgeInsets.all(2),
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
