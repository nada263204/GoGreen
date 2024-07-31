import 'dart:io';

class PostData {
  final String caption;
  final List<File> images;

  PostData({required this.caption, required this.images});

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "images": images.map((image) => image.path).toList(),
      };
}
