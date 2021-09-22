import 'package:dio/dio.dart';
import 'package:flutter_login_bloc_cubit/core/extension/network_path.dart';
import 'package:flutter_login_bloc_cubit/login/model/login_model.dart';
import 'package:flutter_login_bloc_cubit/login/model/token_response_model.dart';

abstract class ILoginService {
  final Dio dio;

  final String loginPath = ILoginServicePath.login.rawValue;
  ILoginService(this.dio);

  Future<TokenResponseModel?>? postUserLogin(LoginModel model) {}
}
