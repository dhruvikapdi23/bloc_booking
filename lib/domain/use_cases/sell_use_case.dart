import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/sell_repository.dart';

class SellUseCase {
  final SellRepository sellRepository;

  SellUseCase({required this.sellRepository});

  Future<Either<RemoteFailure, Map<String, dynamic>>> createSell(Map<String, dynamic> body) async {
    return sellRepository.createSell(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> deleteSell(int id) async {
    return sellRepository.deleteSell(id);
  }

}
