import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/serviceprovider_repository.dart';

class ServiceProviderUserCase {
  final ServiceproviderRepository serviceProviderRepository;

  ServiceProviderUserCase({required this.serviceProviderRepository});

  Future<Either<RemoteFailure, dynamic>> getBusinessCategory() async {
    return serviceProviderRepository.getBusinessCategory();
  }

  Future<Either<RemoteFailure, dynamic>> getSpecializations() async {
    return serviceProviderRepository.getSpecializations();
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> saveServiceprovider(
      Map<String, dynamic> body) async {
    return serviceProviderRepository.saveServiceprovider(body);
  }
}
