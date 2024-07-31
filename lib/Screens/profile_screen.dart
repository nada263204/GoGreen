
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/upload_picture_screen.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/community/posts/view%20model/cubit/post_cubit.dart';
import 'package:graduation_project/features/profile/profile_posts_model/profile_response/profile_response.dart';
import '../Widgets/likes_and_followers_widget.dart';
import 'package:http/http.dart' as http;
import '../Widgets/profile_cover_and_image.dart';
import '../Widgets/profile_tabs.dart';
import '../core/config/theme.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileResponse> profileFuture;
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlkIjoiNjY4MWQ2ZjljMWJjZWY2NDU0NWM5OTQwIiwibmFtZSI6Ik5hZGEiLCJpYXQiOjE3MTk4NDI0NDQsImV4cCI6MTcyNzYxODQ0NH0.bOyaKlopZ8VLwmNpalEjCcjun563zrYFP1t1MNwB2Uw';

  @override
  void initState() {
    super.initState();
    profileFuture = fetchProfile(token);
  }

  Future<ProfileResponse> fetchProfile(String token) async {
    final url = Uri.parse('https://go-green-3w65.onrender.com/api/user/Nada/userProfile');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Failed to load profile');
    }
  }

  final List<File> _images = [];

  void _addImage(File image) {
    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileCoverAndImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      onPressed: () async {
                        final image = await Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => const CreatePostScreen(),
                          ),
                        );
                        if (image != null) {
                          _addImage(image);
                        }
                      },
                      shape: const CircleBorder(),
                      elevation: 0.0,
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {
                      if (state.postState is PostCreationSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile updated successfully')),
                        );
                      } else if (state.postState is PostCreationError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message.toString())),
                        );
                      }
                    },
                    builder: (context, state) {
                      final bool isDark = state.themeMode == ThemeMode.dark;
                      if (state.authState is LoginSuccess ||
                          state.authState is RegisterSuccess) {
                        final user = (state.authState as dynamic).user;
                        return Column(
                          children: [
                            Text(
                              user.name ?? 'No user',
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(context, fontSize: 20.0),
                                fontWeight: FontWeight.bold,
                                color: isDark ? AppTheme.white : AppTheme.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppTheme.grey,
                                ),
                                Text(
                                  'Cairo, Egypt',
                                  style: TextStyle(color: AppTheme.grey),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (state.authState is LoginLoading ||
                          state.authState is RegisterLoading ||
                          state.postState is PostCreationLoading) {
                        return const LoadingIndicator();
                      } else if (state.authState is LoginError ||
                          state.authState is RegisterError ||
                          state.postState is PostCreationError) {
                        return Text(
                          'Invalid User',
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(context, fontSize: 20.0),
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppTheme.white : AppTheme.black,
                          ),
                        );
                      } else {
                        return Text(
                          'Invalid User',
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(context, fontSize: 20.0),
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppTheme.white : AppTheme.black,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 26.0),
                  const LikesAndFollowersWidget(),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  const ProfileTabs(),
                  const SizedBox(height: 5.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: FutureBuilder<ProfileResponse>(
                        future: profileFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const LoadingIndicator();
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.posts == null ||
                              snapshot.data!.posts!.isEmpty) {
                            return const Center(child: Text('No posts available'));
                          }

                          final posts = snapshot.data!.posts!;
                          return GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: posts.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 2 / 3,
                            ),
                            itemBuilder: (context, index) {
                              final post = posts[index];
                              if (post.images == null || post.images!.isEmpty) {
                                return Container();
                              }
                              return Image.network(
                                post.images![0],
                                fit: BoxFit.cover,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}