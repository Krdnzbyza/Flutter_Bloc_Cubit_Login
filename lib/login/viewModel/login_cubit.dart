import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_bloc_cubit/login/model/login_model.dart';
import 'package:flutter_login_bloc_cubit/login/model/token_response_model.dart';
import 'package:flutter_login_bloc_cubit/login/service/i_login_service.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final ILoginService service;

  bool isLoginFail = false;
  bool isLoading = false;
  LoginCubit(this.formKey, this.emailController, this.passwordController,
      {required this.service})
      : super(LoginInitial());
  Future<void> pustUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      chanceLoadingView();
      final data = await service.postUserLogin(LoginModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
      chanceLoadingView();

      if (data is TokenResponseModel) {
        emit(LoginComplete(data));
      } else {}
    } else {
      isLoginFail = true;
      LoginValidateState(isLoginFail);
      emit(LoginValidateState(isLoginFail));
    }
  }

  void chanceLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingeState(isLoading));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final TokenResponseModel model;

  LoginComplete(this.model);
}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginLoadingeState extends LoginState {
  final bool isLoading;

  LoginLoadingeState(this.isLoading);
}
