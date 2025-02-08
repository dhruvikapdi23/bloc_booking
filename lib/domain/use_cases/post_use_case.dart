import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/post_repository.dart';

class PostUseCase {
  final PostRepository postRepository;

  PostUseCase({required this.postRepository});

  Future<Either<RemoteFailure, Map<String, dynamic>>> createPost(Map<String, dynamic> body) async {
    return postRepository.createPost(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> deletePost(int id) async {
    return postRepository.deletePost(id);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> getHomePosts(String query) async {
    return postRepository.getHomePosts(query);

  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> getMyPostables(String query) async {
    return postRepository.getMyPostables(query);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> getMyReactions(String query) async {
    return postRepository.getMyReactions(query);
  }

  Future<Either<RemoteFailure, dynamic>> addComments(Map<String, dynamic> body) async {
    return postRepository.addComments(body);
  }
  Future<Either<RemoteFailure, dynamic>> removeComment(Map<String, dynamic> body) async {
    return postRepository.removeComment(body);
  }

  Future<Either<RemoteFailure, dynamic>> addLike(int postId, String type) async {
    return postRepository.addLike(postId, type);
  }
}
