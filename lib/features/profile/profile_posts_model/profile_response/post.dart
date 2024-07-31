// class ProfilePost {
//   String? caption;
//   List<dynamic>? likes;
//   String? publisher;
//   DateTime? postDate;
//   List<dynamic>? comments;
//   int? v;
//   String? images;

//   ProfilePost({
//     this.caption,
//     this.likes,
//     this.publisher,
//     this.postDate,
//     this.comments,
//     this.v,
//     this.images,
//   });

//   factory ProfilePost.fromJson(Map<String, dynamic> json) => ProfilePost(
//         caption: json['caption'] as String?,
//         likes: json['likes'] as List<dynamic>?,
//         publisher: json['publisher'] as String?,
//         postDate: json['postDate'] == null
//             ? null
//             : DateTime.parse(json['postDate'] as String),
//         comments: json['comments'] as List<dynamic>?,
//         v: json['__v'] as int?,
//         images: json['images'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'caption': caption,
//         'likes': likes,
//         'publisher': publisher,
//         'postDate': postDate?.toIso8601String(),
//         'comments': comments,
//         '__v': v,
//         'images': images,
//       };
// }
class ProfilePost {
  String? caption;
  List<dynamic>? likes;
  String? publisher;
  DateTime? postDate;
  List<dynamic>? comments;
  int? v;
  List<String>? images; // Change to List<String>

  ProfilePost({
    this.caption,
    this.likes,
    this.publisher,
    this.postDate,
    this.comments,
    this.v,
    this.images,
  });

  factory ProfilePost.fromJson(Map<String, dynamic> json) => ProfilePost(
        caption: json['caption'] as String?,
        likes: json['likes'] as List<dynamic>?,
        publisher: json['publisher'] as String?,
        postDate: json['postDate'] == null
            ? null
            : DateTime.parse(json['postDate'] as String),
        comments: json['comments'] as List<dynamic>?,
        v: json['__v'] as int?,
        images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(), // Parse images as List<String>
      );

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'likes': likes,
        'publisher': publisher,
        'postDate': postDate?.toIso8601String(),
        'comments': comments,
        '__v': v,
        'images': images, // Serialize images as List<String>
      };
}
