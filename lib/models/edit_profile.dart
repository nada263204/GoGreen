class EditProfile {
  String? name;
  String? email;
  String? profileImage;
  String? payload;

  EditProfile({this.name, this.email, this.profileImage, this.payload});

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
        name: json['name'] as String?,
        email: json['email'] as String?,
        profileImage: json['profileImage'] as String?,
        payload: json['payload'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImage': profileImage,
        'payload': payload,
      };
}
