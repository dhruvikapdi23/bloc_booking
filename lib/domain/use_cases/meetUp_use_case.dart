// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/meetUp_repository.dart';

class MeetupUseCase {
  final MeetUpRepository meetUpRepository;

  MeetupUseCase({required this.meetUpRepository});

  Future<Either<RemoteFailure, Map<String, dynamic>>> createMeetUp(
      Map<String, dynamic> body) async {
    return meetUpRepository.createMeetUp(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> deleteMeetUp(
      int id) async {
    return meetUpRepository.deleteMeetUp(id);
  }
}
