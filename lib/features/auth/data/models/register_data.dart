// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterData {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String rePassword;

  RegisterData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.rePassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'rePassword': rePassword
    };
  }
}
