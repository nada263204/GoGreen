import 'package:graduation_project/features/post/create_post_response/create_post_response.dart';
import 'package:graduation_project/features/post/post_data.dart';

abstract class PostRemoteDataSource {
  Future<CreatePostResponse> createPost(PostData postData);
}
