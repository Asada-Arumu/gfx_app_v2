class ImageModel {
  final String id;
  final String url;
  final String creatorName;
  final String? title;
  final String? description;
  final DateTime? createdAt;

  ImageModel({
    required this.id,
    required this.url,
    this.title,
    this.description,
    this.createdAt,
    required this.creatorName,
  });

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'].toString(),
      url: map['url'] as String,
      creatorName: map['creator_name'] as String,
      title: map['title'] as String?,
      description: map['description'] as String?,
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }
}
