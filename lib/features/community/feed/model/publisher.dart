class Publisher {
  String? name;
  String? profileImage;

  Publisher({this.name, this.profileImage});

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json['name'] as String?,
        profileImage: json['profileImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'profileImage': profileImage,
      };
}
