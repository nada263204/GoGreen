import 'package:collection/collection.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';

class LoginResponse {
  String? message;
  User? user;
  String? token;

  LoginResponse({this.message, this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LoginResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
}

// import 'package:collection/collection.dart';
// import 'package:graduation_project/features/auth/data/models/user.dart';

// class LoginResponse {
//   String? message;
//   User? user;
//   String? token;

//   LoginResponse({this.message, this.user, this.token});

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         message: json['message'] as String?,
//         user: json['user'] == null
//             ? null
//             : User.fromJson(json['user'] as Map<String, dynamic>),
//         token: json['token'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'message': message,
//         'user': user?.toJson(),
//         'token': token,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! LoginResponse) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
// }

// // class LoginResponse {
// //   final User user;

// //   LoginResponse({required this.user});

// //   factory LoginResponse.fromJson(Map<String, dynamic> json) {
// //     return LoginResponse(
// //       user: User.fromJson(json['user'] ?? {}),
// //     );
// //   }
// // }
