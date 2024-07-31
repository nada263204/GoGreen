import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';
import 'package:graduation_project/Widgets/text_scale.dart';

import '../../../Widgets/chats_list_view.dart';
import '../../../Widgets/fav_chat_list_view.dart';
import '../../../Screens/call_screen.dart';
import '../../../Screens/notification_screen.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 18.0),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const CallScreen(),
                ),
              );
            },
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: FutureBuilder<AllUsers?>(
          future: fetchAllUsers(),
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
            } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
              return const Center(child: Text('No users available'));
            }

            final users = snapshot.data!.data;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 95.0,
                    child: FavChatsListView(users: users!),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(child: ChatsListView(users: users)),
                ],
              ),
            );
          }),
    );
  }

  Future<AllUsers> fetchAllUsers() async {
    final dio = Dio();
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpZCI6IjY2Njc5ZjRkMTYxZGNiZDFmOWMyZWUxYyIsIm5hbWUiOiJOYWRhIiwiaWF0IjoxNzE5NDE3NzI4LCJleHAiOjE3MjcxOTM3Mjh9.96eIJSkOAXTDS2mPCt8J_Fp2bfN7fSF0g5haRZ7Gnlw'; // Replace with your actual token

    try {
      final response = await dio.get(
        'https://go-green-3w65.onrender.com/api/user/allusers/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return AllUsers.fromJson(response.data);
      } else {
        throw Exception('Failed to load users');
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
