import 'package:graduation_project/features/post/create_post_response/publisher.dart';

class Post {
  String? caption;
  List<dynamic>? likes;
  Publisher? publisher;
  String? images;
  String? id;
  DateTime? postDate;
  List<dynamic>? comments;
  int? v;

  Post({
    this.caption,
    this.likes,
    this.publisher,
    this.images,
    this.id,
    this.postDate,
    this.comments,
    this.v,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        caption: json['caption'] as String?,
        likes: json['likes'] as List<dynamic>?,
        publisher: json['publisher'] == null
            ? null
            : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
        images: json['images'] as String?,
        id: json['_id'] as String?,
        postDate: json['postDate'] == null
            ? null
            : DateTime.parse(json['postDate'] as String),
        comments: json['comments'] as List<dynamic>?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'likes': likes,
        'publisher': publisher?.toJson(),
        'images': images,
        '_id': id,
        'postDate': postDate?.toIso8601String(),
        'comments': comments,
        '__v': v,
      };
}
