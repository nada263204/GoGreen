// import 'package:collection/collection.dart';

// class User {
//   String? name;
//   String? email;
//   String? role;

//   User({this.name, this.email, this.role});

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         name: json['name'] as String?,
//         email: json['email'] as String?,
//         role: json['role'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'email': email,
//         'role': role,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! User) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode => name.hashCode ^ email.hashCode ^ role.hashCode;
// }
