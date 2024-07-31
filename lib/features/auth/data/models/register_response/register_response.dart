import 'package:collection/collection.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';

class RegisterResponse {
  String? message;
  User? user;
  String? token;

  RegisterResponse({this.message, this.user, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      user: json['user'] == null ? null : User.fromJson(json['user']),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RegisterResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
}
// import '../user.dart';

// // class RegisterResponse {
// //   String? message;
// //   User? user;
// //   String? token;

// //   RegisterResponse({this.message, this.user, this.token});

// //   factory RegisterResponse.fromJson(Map<String, dynamic> json) {
// //     return RegisterResponse(
// //       message: json['message'] as String?,
// //       user: json['user'] == null
// //           ? null
// //           : User.fromJson(json['user'] as Map<String, dynamic>),
// //       token: json['token'] as String?,
// //     );
// //   }

// //   Map<String, dynamic> toJson() => {
// //         'message': message,
// //         'user': user?.toJson(),
// //         'token': token,
// //       };

// //   @override
// //   bool operator ==(Object other) {
// //     if (identical(other, this)) return true;
// //     if (other is! RegisterResponse) return false;
// //     final mapEquals = const DeepCollectionEquality().equals;
// //     return mapEquals(other.toJson(), toJson());
// //   }

// //   @override
// //   int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
// // }

// class RegisterResponse {
//   final User user;

//   RegisterResponse({required this.user});

//   factory RegisterResponse.fromJson(Map<String, dynamic> json) {
//     return RegisterResponse(
//       user: User.fromJson(json['user']),
//     );
//   }
// }
