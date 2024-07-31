// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
// import 'package:graduation_project/features/profile/edit_user_profile/cubit/edit_profile_cubit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
// import 'package:graduation_project/core/config/theme.dart';
// import 'package:graduation_project/core/widgets/widgets/custom_form_field.dart';
// import 'package:graduation_project/Widgets/back_button.dart';
// import 'package:graduation_project/Widgets/profile_image_widget.dart';
// import 'package:graduation_project/Widgets/text_scale.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   File? _selectedImage;
//   late AppCubit _appCubit;

//   @override
//   void initState() {
//     super.initState();
//     _appCubit = BlocProvider.of<AppCubit>(context);
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//       print('Picked image path: ${pickedFile.path}');
//     } else {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Only images are allowed')),
//       );
//     }
//   }

//   void _saveChanges() {
//     _appCubit.editProfile(EditProfileData(
//       name: _nameController.text,
//       imagePath: _selectedImage,
//     ));
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CustomBackButton(),
//         title: Text(
//           'Edit Profile',
//           style: TextStyle(
//             fontSize: getResponsiveFontSize(context, fontSize: 24.0),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   ProfileImageWidget(
//                     imageFile: _selectedImage,
//                     imageUrl: "assets/images/avatar.jpeg",
//                   ),
//                   IconButton(
//                     onPressed: () => _pickImage(ImageSource.gallery),
//                     icon: Icon(
//                       Icons.camera_alt,
//                       color: AppTheme.primary,
//                       size: 30.0,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               CustomFormFiled(
//                 controller: _nameController,
//                 hint: 'Name',
//                 title: 'Name',
//               ),
//               CustomFormFiled(
//                 controller: _emailController,
//                 hint: 'Email',
//                 title: 'Email',
//               ),
//               const SizedBox(height: 30.0),
//               BlocListener<AppCubit, AppState>(
//                 bloc: _appCubit,
//                 listener: (context, state) {
//                   if (state.editProfileState is EditProfileSuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text('Profile updated successfully')),
//                     );
//                     Navigator.pop(context);
//                   } else if (state.editProfileState is EditProfileLoading) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                             (state.editProfileState as EditProfileError).message),
//                       ),
//                     );
//                   }
//                 },
//                 child: ElevatedButton(
//                   onPressed: _saveChanges,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppTheme.primary,
//                     minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50.0),
//                   ),
//                   child: Text(
//                     'Save changes',
//                     style: TextStyle(
//                       fontSize: getResponsiveFontSize(context, fontSize: 20.0),
//                       fontWeight: FontWeight.w500,
//                       color: AppTheme.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/profile/edit_user_profile/cubit/edit_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/widgets/custom_form_field.dart';
import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/Widgets/profile_image_widget.dart';
import 'package:graduation_project/Widgets/text_scale.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _selectedImage;
  late AppCubit _appCubit;

  @override
  void initState() {
    super.initState();
    _appCubit = BlocProvider.of<AppCubit>(context);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      print('Picked image path: ${pickedFile.path}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Only images are allowed')),
      );
    }
  }

  void _saveChanges() {
    _appCubit.editProfile(EditProfileData(
      name: _nameController.text,
      imagePath: _selectedImage,
    ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ProfileImageWidget(
                    imageFile: _selectedImage,
                    imageUrl: "assets/images/avatar.jpeg",
                  ),
                  IconButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppTheme.primary,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              CustomFormFiled(
                controller: _nameController,
                hint: 'Name',
                title: 'Name',
              ),
              CustomFormFiled(
                controller: _emailController,
                hint: 'Email',
                title: 'Email',
              ),
              const SizedBox(height: 30.0),
              BlocListener<AppCubit, AppState>(
                bloc: _appCubit,
                listener: (context, state) {
                  if (state.editProfileState is EditProfileSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated successfully')),
                    );
                    Navigator.pop(context);
                  } else if (state.editProfileState is EditProfileError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text((state.editProfileState as EditProfileError).message),
                      ),
                    );
                  } else if (state.editProfileState is EditProfileLoading) {
                    // Show a loading indicator or handle loading state
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Updating profile...')),
                    );
                  }
                },
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50.0),
                  ),
                  child: Text(
                    'Save changes',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 20.0),
                      fontWeight: FontWeight.w500,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
