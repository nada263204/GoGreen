class EditProfileResponse {
  EditProfileResponse({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.payload,
  });

  final String? name;
  final String? email;
  final String? profileImage;
  final String? payload;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
      name: json["name"],
      email: json["email"],
      profileImage: json["profileImage"],
      payload: json["payload"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profileImage": profileImage,
        "payload": payload,
      };
}
