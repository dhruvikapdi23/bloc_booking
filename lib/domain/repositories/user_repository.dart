import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../models/social_login_class.dart';

abstract class UserRepository {
  Future<Either<RemoteFailure, Map<String, dynamic>>> createUser(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> sendOtp(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> verifyOtp(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> city();
  Future<Either<RemoteFailure, Map<String, dynamic>>> getCurrentUser();
  Future<Either<RemoteFailure, Map<String, dynamic>>> usersUpdate(Map<String, dynamic> body);

}

abstract class SocialLoginRepository {
  Future<SocialLoginClass> signInWithGoogle();
  Future<SocialLoginClass> signInWithApple();
}
