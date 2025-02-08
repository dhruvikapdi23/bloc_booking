import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> createUser(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.createUser(body);
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> sendOtp(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.sendOtp(body);
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> verifyOtp(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.verifyOtp(body);
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> city() async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.city();
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.getCurrentUser();
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<RemoteFailure, Map<String, dynamic>>> usersUpdate(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.usersUpdate(body);
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message, errors: e.errors));
      } catch (e) {
        return Left(RemoteFailure(statusCode: e.runtimeType.hashCode, message: e.toString()));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }
}
