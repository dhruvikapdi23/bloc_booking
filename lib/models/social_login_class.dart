import 'package:firebase_auth/firebase_auth.dart';

class SocialLoginClass {
  String message;
  bool? isSuccess;
  User? user;

  SocialLoginClass({this.message = "", this.isSuccess, this.user});

  factory SocialLoginClass.fromJson(Map<String, dynamic> json) {
    return SocialLoginClass(
        message: json['message'] as String,
        isSuccess: json['isSuccess'] as bool,
        user: json['user']
    );
  }
}