import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/image_repository.dart';
import '../models/image_model.dart';

final imageRepositoryProvider = Provider((ref) => ImageRepository());
final imagesFutureProvider = FutureProvider<List<ImageModel>>((ref) async {
  final repo = ref.read(imageRepositoryProvider);
  return repo.fetchImages();
});
