import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class ServiceproviderRepository {
  Future<Either<RemoteFailure, Map<String, dynamic>>> getBusinessCategory();
  Future<Either<RemoteFailure, Map<String, dynamic>>> getSpecializations();
  Future<Either<RemoteFailure, Map<String, dynamic>>> saveServiceprovider(Map<String, dynamic> body);
}
