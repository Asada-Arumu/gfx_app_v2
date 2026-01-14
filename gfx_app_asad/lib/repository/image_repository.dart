import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/image_model.dart';

class ImageRepository {
  final supabase = Supabase.instance.client;

  Future<List<ImageModel>> fetchImages() async {
    final res = await supabase.from('images').select().order('created_at', ascending: false) as List<dynamic>;
    return res.map((e) => ImageModel.fromMap(e as Map<String, dynamic>)).toList();
  }
}
