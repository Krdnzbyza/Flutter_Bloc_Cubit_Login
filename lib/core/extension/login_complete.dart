import 'package:flutter/material.dart';
import 'package:flutter_login_bloc_cubit/core/constants/string_constants.dart';
import 'package:flutter_login_bloc_cubit/login/viewModel/login_cubit.dart';

extension LoginCompleteExtension on LoginComplete {
  void loginCompleteMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringConstants.loginSucces)));
  }
}
