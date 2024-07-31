import 'post.dart';

class ProfileResponse {
  String? name;
  String? profileImage;
  int? followers;
  int? following;
  List<ProfilePost>? posts;

  ProfileResponse({
    this.name,
    this.profileImage,
    this.followers,
    this.following,
    this.posts,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      name: json['name'] as String?,
      profileImage: json['profileImage'] as String?,
      followers: json['followers'] as int?,
      following: json['following'] as int?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => ProfilePost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'profileImage': profileImage,
        'followers': followers,
        'following': following,
        'posts': posts?.map((e) => e.toJson()).toList(),
      };
}
