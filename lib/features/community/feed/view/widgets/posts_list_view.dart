import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/feed/view/widgets/post_item_widget.dart';
import 'package:graduation_project/features/community/feed/model/feed_post_response.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FeedPostResponse>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Error:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No posts available'));
        }

        final posts = snapshot.data!;
        return ListView.separated(
          reverse: true,
          itemCount: posts.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20.0);
          },
          itemBuilder: (BuildContext context, int index) {
            return PostItemWidget(post: posts[index]);
          },
        );
      },
    );
  }

  Future<List<FeedPostResponse>> fetchPosts() async {
    final dio = Dio();
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoiNjY4MWQ2ZjljMWJjZWY2NDU0NWM5OTQwIiwibmFtZSI6Ik5hZGEiLCJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJpYXQiOjE3MTk3ODUyMDksImV4cCI6MTcyNzU2MTIwOX0.cbz6owlSLLzopXYOqZWNMrqtTD-recjcpTsh0wLDssw';

    try {
      final response = await dio.get(
        'https://go-green-3w65.onrender.com/api/post/user/feed',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        List jsonResponse = response.data;
        return jsonResponse
            .map((post) => FeedPostResponse.fromJson(post))
            .toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } on DioError catch (e) {
      // Handle Dio errors
      throw Exception('Error: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
