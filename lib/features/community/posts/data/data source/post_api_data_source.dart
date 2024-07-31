import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graduation_project/features/post/create_post_response/create_post_response.dart';
import 'package:graduation_project/features/post/post_data.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class PostAPIDataSource {
  final Dio _dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl: 'https://go-green-3w65.onrender.com/api',
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  Future<CreatePostResponse> createPost(PostData postData) async {
    List<MultipartFile> multipartImages = [];
    for (File image in postData.images) {
      String fileName = image.path.split('/').last;
      String? mimeType = lookupMimeType(image.path);
      mimeType ??= 'application/octet-stream';
      multipartImages.add(await MultipartFile.fromFile(image.path,
          filename: fileName, contentType: MediaType.parse(mimeType)));
    }

    final formData = FormData.fromMap({
      'caption': postData.caption,
      'images': multipartImages,
    });

    final response = await _dio.post(
      "/post/new",
      data: formData,
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlkIjoiNjY4MWQ2ZjljMWJjZWY2NDU0NWM5OTQwIiwibmFtZSI6Ik5hZGEiLCJpYXQiOjE3MTk4NDI0NDQsImV4cCI6MTcyNzYxODQ0NH0.bOyaKlopZ8VLwmNpalEjCcjun563zrYFP1t1MNwB2Uw',
        },
      ),
    );

    print('Create Post Response: ${response.data}');
    if (response.data != null) {
      return CreatePostResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to create post");
    }
  }
}
