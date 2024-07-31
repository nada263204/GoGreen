import 'publisher.dart';

class FeedPostResponse {
  String? caption;
  DateTime? postDate;
  int? likes;
  Publisher? publisher;
  List<String>? images;

  FeedPostResponse({
    this.caption,
    this.postDate,
    this.likes,
    this.publisher,
    this.images,
  });

  factory FeedPostResponse.fromJson(Map<String, dynamic> json) {
    return FeedPostResponse(
      caption: json['caption'] as String?,
      postDate: json['postDate'] == null
          ? null
          : DateTime.parse(json['postDate'] as String),
      likes: json['likes'] as int?,
      publisher: json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
      images: json['images'] is List<dynamic>
          ? (json['images'] as List<dynamic>)
              .map((item) => item as String)
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'postDate': postDate?.toIso8601String(),
        'likes': likes,
        'publisher': publisher?.toJson(),
        'images': images,
      };
}
