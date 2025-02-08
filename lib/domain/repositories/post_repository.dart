import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class PostRepository {
  Future<Either<RemoteFailure, Map<String, dynamic>>> createPost(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> deletePost(int id);
  Future<Either<RemoteFailure, Map<String, dynamic>>> getHomePosts(String query);
  Future<Either<RemoteFailure, Map<String, dynamic>>> getMyPostables(String query);
  Future<Either<RemoteFailure, Map<String, dynamic>>> getMyReactions(String query);
  Future<Either<RemoteFailure, Map<String, dynamic>>> addComments(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> removeComment(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> addLike(int postId, String type);
}
