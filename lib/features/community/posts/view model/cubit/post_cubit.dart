// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:graduation_project/features/community/posts/data/data%20source/post_api_data_source.dart';
// import 'package:graduation_project/features/community/posts/data/repository/post_repository.dart';
// import 'package:graduation_project/features/post/create_post_response/create_post_response.dart';
// import 'package:graduation_project/features/post/post_data.dart';

// part 'post_state.dart';

// class PostCubit extends Cubit<PostState> {
//   PostCubit() : super(PostInitial());
//   final _postRepository = PostRepository(PostAPIDataSource());

//   Future<void> createPost(PostData postData) async {
//     emit(PostCreationLoading());
//     try {
//       final createPostResponse = await _postRepository.createPost(postData);
//       emit(PostCreationSuccess(createPostResponse));
//     } catch (error) {
//       emit(PostCreationError('An error occurred: $error',
//           message: 'An error occurred: $error'));
//     }
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/community/posts/data/data%20source/post_api_data_source.dart';
import 'package:graduation_project/features/community/posts/data/repository/post_repository.dart';
import 'package:graduation_project/features/post/create_post_response/create_post_response.dart';
import 'package:graduation_project/features/post/post_data.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  final _postRepository = PostRepository(PostAPIDataSource());

  Future<void> createPost(PostData postData) async {
    emit(PostCreationLoading());
    try {
      final createPostResponse = await _postRepository.createPost(postData);
      emit(PostCreationSuccess(createPostResponse));
    } catch (error) {
      emit(PostCreationError('An error occurred: $error',
          message: 'An error occurred: $error'));
    }
  }
}
