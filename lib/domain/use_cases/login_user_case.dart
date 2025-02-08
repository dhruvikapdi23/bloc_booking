
import 'package:dartz/dartz.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../core/error/failures.dart';
import '../../models/social_login_class.dart';
import '../repositories/user_repository.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginUseCase {
  final UserRepository userRepository;


  LoginUseCase({required this.userRepository});

  Future<Either<RemoteFailure, Map<String, dynamic>>> createUser(Map<String, dynamic> body) async {
    return userRepository.createUser(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> sendOtp(Map<String, dynamic> body) async {
    return userRepository.sendOtp(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> verifyOtp(Map<String, dynamic> body) async {
    return userRepository.verifyOtp(body);
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> city() async {
    return userRepository.city();
  }

  Future<Either<RemoteFailure, dynamic>> getCurrentUser() async {
    return userRepository.getCurrentUser();
  }

  Future<Either<RemoteFailure, Map<String, dynamic>>> usersUpdate(Map<String, dynamic> body) async {
    return userRepository.usersUpdate(body);
  }

}

class SocialLoginUseCase{
  EmailAuth emailAuth = EmailAuth(
      sessionName: "paxpass"
  );

  // SignIn With Google Method
  Future<SocialLoginClass> signInWithGoogle() async {
    User? user;
    SocialLoginClass? socialLoginClass;
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      user = (await auth.signInWithCredential(credential)).user;

      socialLoginClass =
          SocialLoginClass(isSuccess: true, message: "Data Fetch", user: user);
      return socialLoginClass;
    } catch (e) {
      socialLoginClass =
          SocialLoginClass(isSuccess: false, message: e.toString(), user: null);

      return socialLoginClass;
    } finally {

    }
  }


  // SignIn With Apple Method
  Future<SocialLoginClass> signInWithApple() async {
    User? user;
    SocialLoginClass? socialLoginClass;
    try {
      /* //  final FirebaseAuth auth = FirebaseAuth.instance.signInWithEmailLink(email: email, emailLink: emailLink);
      emailAuth.config({"server":"","serverKey":""});
      bool isSend = await emailAuth.sendOtp(recipientMail: email, otpLength: 5);
      if (isSend) {

        log("OTP SEND");
        socialLoginClass = SocialLoginClass(
            isSuccess: true, message: "OTP SEND", user: user);
        return socialLoginClass;
      } else {
        log("NOT SEND");

        socialLoginClass = SocialLoginClass(
            isSuccess: false, message: "OTP NOT SEND", user: user);
        return socialLoginClass;
      }*/

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final rawNonce = generateNonce();

      final FirebaseAuth auth = FirebaseAuth.instance;
      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );

      user = (await auth.signInWithCredential(oauthCredential)).user;
      socialLoginClass = SocialLoginClass(
          isSuccess: true, message: "APPLE LOGIN", user: user);
      return socialLoginClass;
    } catch (e) {
      socialLoginClass =
          SocialLoginClass(isSuccess: false, message: e.toString(), user: null);

      return socialLoginClass;
    } finally {

    }
  }
}