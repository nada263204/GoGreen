class ForgetData {
  final String email;

  ForgetData({required this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
