import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreatorsPick extends StatefulWidget {
  const CreatorsPick({super.key});

  @override
  State<CreatorsPick> createState() => _CreatorsPickState();
}

class _CreatorsPickState extends State<CreatorsPick> {
  final supabase = Supabase.instance.client;
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = fetchCreatorPickImages();
  }

  Future<List<String>> fetchCreatorPickImages() async {
    final response = await supabase
        .from('images')
        .select('url')
        .eq('is_pickedbycreator', true)
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
            child: Center(child: Text('No creator picks')),
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
