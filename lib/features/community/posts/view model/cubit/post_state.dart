part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];

  get message => null;
}

class PostInitial extends PostState {}

// New Post-related states
class PostCreationLoading extends PostState {}

class PostCreationSuccess extends PostState {
  final CreatePostResponse createPostResponse;

  PostCreationSuccess(this.createPostResponse);
  @override
  List<Object?> get props => [createPostResponse];
}

class PostCreationError extends PostState {
  final String message;

  PostCreationError(String error, {required this.message});
}
