class AllUsers {
  bool? success;
  int? count;
  List<Data>? data;

  AllUsers({this.success, this.count, this.data});

  AllUsers.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? googleId;
  String? profileImage;
  List<String>? following;
  List<String>? followers;
  List<String>? posts;
  String? role;
  bool? active;
  bool? emailVerified;
  Null passwordHashedKey;
  Null passwordRandomKey;
  Null passwordResetExpiresIn;
  Null passwordResetVerified;
  int? points;
  int? recycles;
  String? updatedAt;
  String? rank;
  String? id;
  String? phone;
  Null emailRandomKey;
  String? createdAt;

  Data(
      {this.sId,
      this.name,
      this.email,
      this.googleId,
      this.profileImage,
      this.following,
      this.followers,
      this.posts,
      this.role,
      this.active,
      this.emailVerified,
      this.passwordHashedKey,
      this.passwordRandomKey,
      this.passwordResetExpiresIn,
      this.passwordResetVerified,
      this.points,
      this.recycles,
      this.updatedAt,
      this.rank,
      this.id,
      this.phone,
      this.emailRandomKey,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    googleId = json['google_id'];
    profileImage = json['profileImage'];
    following = json['following'].cast<String>();
    followers = json['followers'].cast<String>();
    posts = json['posts'].cast<String>();
    role = json['role'];
    active = json['active'];
    emailVerified = json['emailVerified'];
    passwordHashedKey = json['passwordHashedKey'];
    passwordRandomKey = json['passwordRandomKey'];
    passwordResetExpiresIn = json['passwordResetExpiresIn'];
    passwordResetVerified = json['passwordResetVerified'];
    points = json['points'];
    recycles = json['recycles'];
    updatedAt = json['updatedAt'];
    rank = json['rank'];
    id = json['id'];
    phone = json['phone'];
    emailRandomKey = json['emailRandomKey'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = email;
    data['google_id'] = this.googleId;
    data['profileImage'] = this.profileImage;
    data['following'] = this.following;
    data['followers'] = this.followers;
    data['posts'] = this.posts;
    data['role'] = this.role;
    data['active'] = this.active;
    data['emailVerified'] = this.emailVerified;
    data['passwordHashedKey'] = this.passwordHashedKey;
    data['passwordRandomKey'] = this.passwordRandomKey;
    data['passwordResetExpiresIn'] = this.passwordResetExpiresIn;
    data['passwordResetVerified'] = this.passwordResetVerified;
    data['points'] = this.points;
    data['recycles'] = this.recycles;
    data['updatedAt'] = this.updatedAt;
    data['rank'] = this.rank;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['emailRandomKey'] = this.emailRandomKey;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
