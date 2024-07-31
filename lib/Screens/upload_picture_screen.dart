import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/features/community/posts/view%20model/cubit/post_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/post/post_data.dart';
import 'profile_screen.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _selectedImages = [];
  final TextEditingController _captionController = TextEditingController();
  late AppCubit _appCubit;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
      print('Picked image path: ${pickedFile.path}');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Only images are allowed')),
      );
    }
  }

  void _createPost() {
    if (_selectedImages.isNotEmpty && _captionController.text.isNotEmpty) {
      _appCubit.createPost(
        PostData(
          caption: _captionController.text,
          images: _selectedImages,
        ),
      );
      print(
          'Selected image paths: ${_selectedImages.map((image) => image.path).toList()}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Please select at least one image and enter a caption')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _appCubit = BlocProvider.of<AppCubit>(context);
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    border: Border.all(
                      width: 2.0,
                      color: AppTheme.primary,
                    ),
                  ),
                  child: Center(
                    child: _selectedImages.isEmpty
                        ? Image.asset('assets/images/upload.png')
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _selectedImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(_selectedImages[index]),
                              );
                            },
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.camera),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.white,
                    ),
                    icon: const Icon(Icons.camera_alt_sharp),
                    label: const Text('Take photo'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.white,
                    ),
                    icon: const Icon(Icons.image),
                    label: const Text('Browse gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 35.0),
              TextFormField(
                controller: _captionController,
                decoration: InputDecoration(
                  hintText: 'Write a Caption...',
                  hintStyle: TextStyle(
                    color: AppTheme.grey,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              BlocListener<AppCubit, AppState>(
                bloc: _appCubit,
                listener: (context, state) {
                  if (state.postState is PostCreationLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.postState is PostCreationSuccess) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Post created successfully!')),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  } else if (state.postState is PostCreationError) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: Center(
                  child: ElevatedButton(
                    onPressed: _createPost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.white,
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width * 0.65,
                        50.0,
                      ),
                    ),
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 22.0,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
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
