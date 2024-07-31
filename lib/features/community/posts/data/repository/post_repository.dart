import 'package:graduation_project/features/community/posts/data/data%20source/post_api_data_source.dart';
import 'package:graduation_project/features/post/create_post_response/create_post_response.dart';
import 'package:graduation_project/features/post/post_data.dart';

class PostRepository {
  final PostAPIDataSource _dataSource;

  PostRepository(this._dataSource);

  Future<CreatePostResponse> createPost(PostData postData) async {
    return await _dataSource.createPost(postData);
  }
}
