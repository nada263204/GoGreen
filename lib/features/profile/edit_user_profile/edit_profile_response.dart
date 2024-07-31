class EditProfileResponse {
  String? name;
  String? email;
  String? profileImage;
  String? payload;

  EditProfileResponse({
    this.name,
    this.email,
    this.profileImage,
    this.payload,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      profileImage: json['profileImage'] as String?,
      payload: json['payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImage': profileImage,
        'payload': payload,
      };
}
