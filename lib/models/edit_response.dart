class EditResponse {
  String? name;
  String? email;
  String? profileImage;
  String? payload;

  EditResponse({this.name, this.email, this.profileImage, this.payload});

  factory EditResponse.fromJson(Map<String, dynamic> json) => EditResponse(
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
