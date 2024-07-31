
// class CreatePostResponse {
// //   final String message;
// //   final Post post;

// //   CreatePostResponse({required this.message, required this.post});

// //   factory CreatePostResponse.fromJson(Map<String, dynamic> json) {
// //     return CreatePostResponse(
// //       message: json['message'] as String,
// //       post: Post.fromJson(json['post'] as Map<String, dynamic>),
// //     );
// //   }
// // }


// ///////////////////////////////////////////////////////////////////////////
// String? message;
//   Name? name;
//   String? picture;

//   CreatePostResponse({this.message, this.name, this.picture});

//   CreatePostResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     picture = json['picture'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.name != null) {
//       data['name'] = this.name!.toJson();
//     }
//     data['picture'] = this.picture;
//     return data;
//   }
// }

// class Name {
//   String? name;
//   Null id;

//   Name({this.name, this.id});

//   Name.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['id'] = this.id;
//     return data;
//   }
// }



class CreatePostResponse {
  String? message;
  Name? name;
  List<String>? pictures;

  CreatePostResponse({this.message, this.name, this.pictures});

  CreatePostResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['pictures'] != null) {
      pictures = List<String>.from(json['pictures']);
    } else {
      pictures = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['pictures'] = pictures;
    return data;
  }
}

class Name {
  String? name;
  dynamic id;

  Name({this.name, this.id});

  Name.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
