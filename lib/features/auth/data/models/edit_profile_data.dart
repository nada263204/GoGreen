// import 'dart:io';

import 'dart:io';

class EditProfileData {
  final String name;
  final File? imagePath;

  EditProfileData({required this.name, this.imagePath});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imagePath': imagePath,
    };
  }
}
