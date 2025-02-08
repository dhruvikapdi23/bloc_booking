import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/helper.dart';
import '../../../data/data_sources/local_data_source.dart';
import '../../../domain/use_cases/login_user_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final LocalDataSource localDataSource;
  LoginCubit({required this.loginUseCase, required this.localDataSource}) : super(LoginInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController txtMobile = TextEditingController();

  init() {
    txtMobile.text = "";
    _visibilityController.sink.add(txtMobile.text);

  }

  final _visibilityController = StreamController<String>();

  // Stream for exposing state changes
  Stream<String> get isButtonVisible => _visibilityController.stream;

  void buttonVisibility() {
    _visibilityController.sink.add(txtMobile.text);
  }

  // Dispose method to close the stream when not needed
  void dispose() {
    _visibilityController.close();
  }

  bool isLoading = false;
  login(context) async {
    try {
      emit(LoginLoading());
      isLoading = true;
      var formData = {"mobileNumber": txtMobile.text};
      final response = await loginUseCase.sendOtp(formData);
      response.fold(
        (failure) {
          isLoading = false;
          showSnackBar(context: context, message: failure.message.toString(), error: true);
          emit(LoginFailed(failure.message));
        },
        (data) async {
          isLoading = false;
          if (data["data"] != null) {
            printLog("::: authToken : ${data["data"]}");
            localDataSource.cacheAuthToken(data["data"]);
            emit(const LoginSuccess(""));
          } else {
            emit(LoginSuccess(txtMobile.text));
          }
        },
      );
    } on Exception catch (e) {
      isLoading = false;
      if (kDebugMode) {
        print("Login Catch");
      }
      emit(LoginFailed(e.toString()));
    }
  }
}
