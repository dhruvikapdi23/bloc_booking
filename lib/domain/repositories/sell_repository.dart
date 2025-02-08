import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class SellRepository {
  Future<Either<RemoteFailure, Map<String, dynamic>>> createSell(Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> deleteSell(int id);
}
