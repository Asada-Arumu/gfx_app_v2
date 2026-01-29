import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widget/explore_swipe.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final supabase = Supabase.instance.client;
  late Future<List<String>> _futureImages;

  @override
  void initState() {
    super.initState();
    _futureImages = fetchAllImages();
  }

  Future<List<String>> fetchAllImages() async {
    final response = await supabase
        .from('images')
        .select('url')
        .order('created_at', ascending: true);

    return response
        .map<String>((item) => item['url'] as String)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: const Color(0xFF67C090),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Explore',
                    style: TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.account_circle_outlined,
                      color: Color(0xFFF7F7F7), size: 35),
                ],
              ),
            ),

            const ExploreSwipe(),

            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Pinterest: Karhylselft',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
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
                    ),
                  ),

                  const SizedBox(height: 10),

                  FutureBuilder<List<String>>(
                    future: _futureImages,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No images available'),
                        );
                      }

                      final images = snapshot.data!;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),

                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: Colors.grey[200],
                                );
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
