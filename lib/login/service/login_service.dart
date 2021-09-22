import 'dart:io';

import 'package:dio/src/dio.dart';
import 'package:flutter_login_bloc_cubit/login/model/login_model.dart';
import 'package:flutter_login_bloc_cubit/login/model/token_response_model.dart';
import 'package:flutter_login_bloc_cubit/login/service/i_login_service.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<TokenResponseModel?> postUserLogin(LoginModel model) async {
    final response = await dio.post(loginPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return TokenResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
