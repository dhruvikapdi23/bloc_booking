// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class MeetUpRepository {
  Future<Either<RemoteFailure, Map<String, dynamic>>> createMeetUp(
      Map<String, dynamic> body);
  Future<Either<RemoteFailure, Map<String, dynamic>>> deleteMeetUp(int id);
}
