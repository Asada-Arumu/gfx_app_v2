import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../providers/image_providers.dart';

class RemoteGallery extends ConsumerWidget {
  const RemoteGallery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncImages = ref.watch(imagesFutureProvider);

    return asyncImages.when(
      data: (images) {
        if (images.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No remote images found.'),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            
            itemCount: images.length,

            itemBuilder: (context, index) {
              final img = images[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: img.url,
                  fit: BoxFit.cover,
                  placeholder: (c, s) => Container(color: Colors.grey[300]),
                  errorWidget: (c, s, e) => Container(color: Colors.grey, child: const Icon(Icons.broken_image)),
                ),
              );
            },
          ),
        );
      },

      loading: () => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      ),

      error: (err, st) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Error loading images: $err'),
      ),
    );
  }
}
