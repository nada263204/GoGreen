class User {
  String? name;
  String? email;
  String? role;
  String? phoneNumber;
  String? profilePicture;
  int? points;
  int? recycles;

  User(
      {this.name,
      this.email,
      this.role,
      this.profilePicture,
      this.phoneNumber,
      this.points,
      this.recycles});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String? ?? 'Unknown User',
        email: json['email'] as String? ?? '',
        role: json['role'] as String? ?? '',
        profilePicture:
            json['profilePicture'] as String? ?? 'assets/images/avatar.jpeg',
        points: json['points'] as int? ?? 0,
        recycles: json['recycles'] as int? ?? 10,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
        'profilePicture': profilePicture,
        'points': points,
        'recycles': recycles
      };

  User copyWith(
      {String? name,
      String? email,
      String? role,
      String? phoneNumber,
      String? profilePicture,
      int? points,
      int? recycles}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? profilePicture,
    );
  }
}
